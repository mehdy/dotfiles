vim.g.rustaceanvim = {
	server = {
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
