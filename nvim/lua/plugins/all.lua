return {
	{ "folke/neoconf.nvim" },
	{ "benomahony/uv.nvim" },
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
	{ "folke/tokyonight.nvim" }, -- colorscheme

	{ "hrsh7th/nvim-cmp" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- path completions
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{
		"jhofscheier/ltex-utils.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
		},
	},
	{ "L3MON4D3/LuaSnip" }, -- snippet engine
	{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

	{ "neovim/nvim-lspconfig" }, -- enable LSP
	{ "williamboman/mason.nvim" }, -- simple to use language server installer
	{ "williamboman/mason-lspconfig.nvim" },
	{ "ray-x/lsp_signature.nvim" },
	{ "nvimtools/none-ls.nvim", dependencies = { "nvimtools/none-ls-extras.nvim" } },
	{ "github/copilot.vim" },

	{ "mfussenegger/nvim-dap" },
	{ "nvim-neotest/nvim-nio" },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	{ "leoluz/nvim-dap-go" },

	{
		"ThePrimeagen/refactoring.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	{ "b0o/schemastore.nvim" },

	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-media-files.nvim" },
	{ "nvim-telescope/telescope-live-grep-args.nvim" },

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", lazy = false, branch = "main" },
	{ "windwp/nvim-autopairs" },

	{ "numToStr/Comment.nvim" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },
	{ "sindrets/diffview.nvim" },

	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		build = ':lua require("go.install").update_all_sync()',
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},

	{ "akinsho/bufferline.nvim" },

	{ "akinsho/toggleterm.nvim" },

	{ "folke/which-key.nvim" },

	{ "nvim-lualine/lualine.nvim" },
	{ "moll/vim-bbye" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "RRethy/vim-illuminate" },
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^6",
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "^3.0.0",
	},
}
