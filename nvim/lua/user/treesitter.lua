local status_ok, ts = pcall(require, "nvim-treesitter")
if not status_ok then
	print("failed to load treesitter", status_ok, ts)
	return
end

ts.setup({
	ensure_installed = "all",
	ignore_install = { "" },
	highlight = { enable = true },
	autopairs = { enable = true },
	indent = { enable = false },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"go",
		"proto",
		"lua",
		"python",
		"typescript",
		"tsx",
		"tmux",
		"zsh",
		"bash",
		"cmake",
		"comment",
		"css",
		"diff",
		"dockerfile",
		"gomod",
		"gosum",
		"html",
		"javascript",
		"json",
		"yaml",
		"make",
		"nginx",
		"promql",
		"rust",
		"regex",
		"scss",
		"sql",
		"terraform",
		"toml",
		"vim",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
