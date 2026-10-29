local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- pyproject-fmt has no none-ls builtin; it exits 1 when it changes the input
local pyproject_fmt = require("null-ls.helpers").make_builtin({
	name = "pyproject_fmt",
	method = null_ls.methods.FORMATTING,
	filetypes = { "toml" },
	runtime_condition = function(params)
		return vim.fs.basename(params.bufname) == "pyproject.toml"
	end,
	generator_opts = {
		command = "pyproject-fmt",
		args = { "-s", "-" },
		to_stdin = true,
		check_exit_code = { 0, 1 },
	},
	factory = require("null-ls.helpers").formatter_factory,
})

null_ls.setup({
	on_attach = function(client, bufnr)
		if client:supports_method("textDocument/formatting") then
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					if client:supports_method("textDocument/codeAction") then
						vim.lsp.buf.code_action({
							context = { only = { "source.organizeImports" } },
							apply = true,
						})
					end
					local is_pyproject = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr)) == "pyproject.toml"
					vim.lsp.buf.format({
						async = false,
						timeout_ms = 3000,
						bufnr = bufnr,
						-- let pyproject-fmt own pyproject.toml instead of taplo
						filter = function(c)
							return not (is_pyproject and c.name == "taplo")
						end,
					})
				end,
			})
		end
	end,
	sources = {
		require("none-ls.code_actions.eslint"), -- requires none-ls-extras.nvim
		code_actions.refactoring,
		diagnostics.actionlint,
		diagnostics.ansiblelint,
		diagnostics.buf,
		diagnostics.buildifier,
		diagnostics.checkmake,
		diagnostics.djlint,
		require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
		diagnostics.golangci_lint.with({
			-- same Bazel packages driver as gopls (see user/lsp.lua)
			env = function(params)
				local root = vim.fs.root(params.bufname, "go.mod")
				local driver = root and root .. "/tools/gopls/gopackagesdriver.sh"
				if driver and vim.uv.fs_stat(driver) then
					return { GOPACKAGESDRIVER = driver }
				end
				return {}
			end,
		}),
		diagnostics.hadolint,
		diagnostics.opentofu_validate,
		diagnostics.selene,
		diagnostics.yamllint,
		formatting.black,
		formatting.buf,
		formatting.buildifier,
		formatting.djlint,
		require("none-ls.formatting.eslint"), -- requires none-ls-extras.nvim
		formatting.gofumpt,
		formatting.goimports,
		formatting.golines.with({ extra_args = { "-m", "120" } }),
		formatting.leptosfmt,
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"jsonc",
				"graphql",
				"handlebars",
				"svelte",
				"astro",
				"htmlangular",
			},
		}),
		formatting.opentofu_fmt,
		pyproject_fmt,
		formatting.yamlfmt,
		formatting.stylua,
	},
})
