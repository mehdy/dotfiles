-- FIXME: do I need cmp_nvim_lsp.default_capabilities()?
vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				},
			},
		},
	},
})

vim.lsp.config("jsonls", {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

local ok, lsp_signature = pcall(require, "lsp_signature")
if ok then
	lsp_signature.setup({ hint_enable = false })
else
	vim.notify("plugin lsp_signature not found! Please install it using your package manager.", vim.log.levels.ERROR)
end
