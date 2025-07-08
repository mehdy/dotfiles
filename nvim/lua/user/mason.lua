local ok, mason = pcall(require, "mason")
if not ok then
	vim.notify("Plugin mason not found. Please install it using your package manager.", vim.log.levels.ERROR)
	return
end

mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✅",
			package_pending = "🔄",
			package_uninstalled = "☐",
		},
	},
})

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
	vim.notify("Plugn mason-lspconfig not found. Please install it using your package manager.", vim.log.levels.ERROR)
	return
end

mason_lspconfig.setup({
	ensure_installed = {
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
	},
	automatic_installation = true,
	automatic_enable = true,
})
