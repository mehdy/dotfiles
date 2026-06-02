local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	return
end

aerial.setup({
	-- Prefer LSP symbols, fall back to treesitter when no server is attached.
	backends = { "lsp", "treesitter", "markdown", "man" },
	layout = {
		default_direction = "prefer_right",
	},
	-- Show symbols for the focused window across all buffers.
	attach_mode = "global",
})
