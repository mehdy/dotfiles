local status_ok, go = pcall(require, "go")
if not status_ok then
	return
end

go.setup({
	lsp_cfg = false, -- gopls is configured via nvim-lspconfig / mason
	lsp_keymaps = false, -- keep our own LSP keymaps
	lsp_inlay_hints = { enable = false },
	dap_debug = false, -- debugging handled by nvim-dap-go
})
