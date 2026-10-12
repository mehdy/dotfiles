local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local location = {
	"location",
	padding = 0,
}

local filepath = {
	"filename",
	path = 1, -- 0: Just the filename 1: Relative path 2: Absolute path
	shorting_target = 40, -- Shortens path to leave 40 spaces in the window
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
		lualine_c = { filepath },
		lualine_z = { location },
	},
})
