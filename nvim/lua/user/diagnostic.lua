vim.diagnostic.config({
	signs = {
		active = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "✪" },
			{ name = "DiagnosticSignInfo", text = "" },
		},
	},
	update_in_insert = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
})
