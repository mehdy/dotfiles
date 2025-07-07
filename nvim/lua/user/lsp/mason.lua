local servers = {
	"bashls",
	"dockerls",
	"golangci_lint_ls",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"ltex",
	"prosemd_lsp",
	"pyright",
	"ruff",
	"ts_ls",
	"yamlls",
}

vim.lsp.config("*", {
	capabilities = require("user.lsp.handlers").capabilities,
	on_attach = require("user.lsp.handlers").on_attach,
})

require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✅",
			package_pending = "🔄",
			package_uninstalled = "☐",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
	automatic_enable = true,
})
