local keymap = vim.api.nvim_set_keymap

vim.g.go_metalinter_command = "golangci-lint"
vim.g.go_metalinter_enabled = {}
vim.g.go_metalinter_autosave_enabled = {}

keymap("n", "<leader>m", ":GoMetaLinter<CR>", { noremap = true, silent = true })
keymap("n", "<leader>dr", ":GoDebugRun<CR>", { noremap = true, silent = true })
keymap("n", "<leader>dt", ":GoDebugTest<CR>", { noremap = true, silent = true })
keymap("n", "<leader>db", ":GoDebugBreakpoint<CR>", { noremap = true, silent = true })
keymap("n", "<leader>dc", ":GoDebugContinue<CR>", { noremap = true, silent = true })
keymap("n", "<leader>dn", ":GoDebugNext<CR>", { noremap = true, silent = true })
keymap("n", "<leader>ds", ":GoDebugStep<CR>", { noremap = true, silent = true })
keymap("n", "<leader>dq", ":GoDebugStop<CR>", { noremap = true, silent = true })
