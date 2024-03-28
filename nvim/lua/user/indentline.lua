local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
	return
end

ibl.setup({
	scope = {
		enabled = true,
	},
	exclude = {
		filetypes = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
		},
		buftypes = { "terminal", "nofile" },
	},
	indent = {
		char = "▏",
	},
})
