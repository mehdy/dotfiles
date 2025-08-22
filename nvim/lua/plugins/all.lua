return {
	{ "folke/neoconf.nvim" },
	{ "benomahony/uv.nvim" },
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
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
	{ "puremourning/vimspector" },
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
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

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "windwp/nvim-autopairs" },
	{ "ThePrimeagen/refactoring.nvim" },

	{ "numToStr/Comment.nvim" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },
	{ "sindrets/diffview.nvim" },

	{ "fatih/vim-go" },

	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	{ "kyazdani42/nvim-web-devicons" },

	{ "akinsho/bufferline.nvim" },

	{ "akinsho/toggleterm.nvim" },

	{ "folke/which-key.nvim" },

	{ "nvim-lualine/lualine.nvim" },
	{ "moll/vim-bbye" },
	{ "lewis6991/impatient.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "RRethy/vim-illuminate" },
	{ "preservim/tagbar" },

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
