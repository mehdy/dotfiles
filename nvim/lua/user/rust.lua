vim.g.rustaceanvim = {
	server = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
		default_settings = {
			["rust-analyzer"] = {
				rustfmt = {
					overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
				},
				procMacro = {
					ignored = {
						leptops_macro = {
							"component",
							"server",
						},
					},
				},
			},
		},
	},
}
