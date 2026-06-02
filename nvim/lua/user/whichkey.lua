local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

wk.setup({})

-- Label the leader prefixes so the popup reads as a cheat-sheet.
wk.add({
	{ "<leader>l", group = "LSP / Links" },
	{ "<leader>t", group = "Tree / Tags" },
	{ "<leader>d", group = "Debug" },
	{ "<leader>u", group = "uv" },
	{ "g", group = "Goto / LSP" },
})
