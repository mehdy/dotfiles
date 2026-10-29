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

vim.lsp.config("gopls", {
	cmd = function(dispatchers, config)
		local env
		local driver = config.root_dir and config.root_dir .. "/tools/gopls/gopackagesdriver.sh"
		if driver and vim.uv.fs_stat(driver) then
			env = { GOPACKAGESDRIVER = driver }
		end
		return vim.lsp.rpc.start({ "gopls" }, dispatchers, { cwd = config.cmd_cwd, env = env })
	end,
	settings = {
		gopls = {
			directoryFilters = { "-bazel-bin", "-bazel-out", "-bazel-testlogs", "-bazel-mono-v2", "-node_modules" },
		},
	},
})

local ok, lsp_signature = pcall(require, "lsp_signature")
if ok then
	lsp_signature.setup({ hint_enable = false })
else
	vim.notify("plugin lsp_signature not found! Please install it using your package manager.", vim.log.levels.ERROR)
end
