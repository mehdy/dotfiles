local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.code_action({
						context = { only = { "source.organizeImports" } },
						apply = true,
					})
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	sources = {
		code_actions.ltrs,
		code_actions.refactoring,
		diagnostics.actionlint,
		diagnostics.ansiblelint,
		diagnostics.buf,
		diagnostics.checkmake,
		diagnostics.djlint,
		diagnostics.eslint_d,
		diagnostics.golangci_lint,
		diagnostics.hadolint,
		diagnostics.ltrs,
		diagnostics.pylama,
		diagnostics.ruff,
		diagnostics.selene,
		diagnostics.yamllint,
		formatting.black,
		formatting.buf,
		formatting.djlint,
		formatting.eslint_d,
		formatting.fixjson,
		formatting.gofumpt,
		formatting.goimports,
		formatting.golines.with({ extra_args = { "-m", "120" } }),
		formatting.ruff,
		formatting.rustfmt,
		formatting.yamlfmt,
		formatting.stylua,
	},
})
