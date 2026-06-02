local status_ok, ts = pcall(require, "nvim-treesitter")
if not status_ok then
	print("failed to load treesitter", status_ok, ts)
	return
end

ts.setup()

ts.install({
	"bash",
	"cmake",
	"comment",
	"css",
	"diff",
	"dockerfile",
	"go",
	"gomod",
	"gosum",
	"gowork",
	"hcl",
	"html",
	"javascript",
	"json",
	"lua",
	"luadoc",
	"make",
	"nginx",
	"promql",
	"proto",
	"python",
	"regex",
	"rust",
	"scss",
	"sql",
	"terraform",
	"tmux",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
		if not lang then
			return
		end
		local ok, added = pcall(vim.treesitter.language.add, lang)
		if ok and added then
			vim.treesitter.start(args.buf, lang)
		end
	end,
})
