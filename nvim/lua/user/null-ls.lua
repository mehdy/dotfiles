local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.code_action({
						context = { only = { "source.organizeImports" } },
						apply = true,
					})
					vim.lsp.buf.format({ async = false, timeout_ms = 3000, bufnr = bufnr })
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
		diagnostics.checkmake,
		diagnostics.djlint,
		require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
		diagnostics.golangci_lint,
		diagnostics.hadolint,
		diagnostics.ltrs,
		diagnostics.opentofu_validate,
		diagnostics.selene,
		diagnostics.yamllint,
		formatting.black,
		formatting.buf,
		formatting.djlint,
		require("none-ls.formatting.eslint"), -- requires none-ls-extras.nvim
		formatting.gofumpt,
		formatting.goimports,
		formatting.golines.with({ extra_args = { "-m", "120" } }),
		formatting.leptosfmt,
		formatting.prettier,
		formatting.opentofu_fmt,
		formatting.yamlfmt,
		formatting.stylua,
	},
})
