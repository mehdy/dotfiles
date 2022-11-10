local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width
}

local location = {
	"location",
	padding = 0,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "horizon",
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_b = { "branch", diff, "diagnostics" },
		lualine_c = {},
		lualine_z = { location },
	},
})
