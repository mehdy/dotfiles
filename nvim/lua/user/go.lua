local keymap = vim.api.nvim_set_keymap

vim.g.go_metalinter_command = "golangci-lint"
vim.g.go_metalinter_enabled = {}
vim.g.go_metalinter_autosave_enabled = {}

keymap("n", "<leader>m", ":GoMetaLinter<CR>", { noremap = true, silent = true })
