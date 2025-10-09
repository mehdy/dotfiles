local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

require("dapui").setup()
require("dap-go").setup()
