return {
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
	{ "folke/tokyonight.nvim" }, -- colorscheme

	{ "hrsh7th/nvim-cmp" },    -- The completion plugin
	{ "hrsh7th/cmp-buffer" },  -- buffer completions
	{ "hrsh7th/cmp-path" },    -- path completions
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },

	{ "L3MON4D3/LuaSnip" },        -- snippet engine
	{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

	{ "neovim/nvim-lspconfig" },   -- enable LSP
	{ "williamboman/mason.nvim" }, -- simple to use language server installer
	{ "williamboman/mason-lspconfig.nvim" },
	{ "ray-x/lsp_signature.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "github/copilot.vim" },
	{ "puremourning/vimspector" },
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui",                       dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }, },

	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-media-files.nvim" },

	{ "nvim-treesitter/nvim-treesitter",            build = ":TSUpdate", },
	{ "windwp/nvim-autopairs" },
	{ "ThePrimeagen/refactoring.nvim" },

	{ "numToStr/Comment.nvim" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },

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
}
