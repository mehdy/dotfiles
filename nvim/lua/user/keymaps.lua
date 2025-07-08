local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Better control of neovim
vim.cmd([[
	cnoreabbrev sw w !sudo tee %
	cnoreabbrev W! w!
	cnoreabbrev Wq wq
	cnoreabbrev Wqa wqa
	cnoreabbrev W w
	cnoreabbrev Q! q!
	cnoreabbrev Qa! qa!
	cnoreabbrev Q q
	cnoreabbrev Qa qa
]])

-- clear hlsearch
keymap("n", "<leader><space>", ":noh<CR>", opts)

-- Split windows
keymap("n", "<leader>s", ":split<CR>", opts)
keymap("n", "<leader>v", ":vsplit<CR>", opts)

-- Better window navigation
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-S-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-S-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<leader>q", ":bprevious<CR>", opts)
keymap("n", "<leader>w", ":bnext<CR>", opts)
keymap("n", "<leader>x", ":Bdelete<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- Extensions
keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeFindFile<CR>", opts)
keymap("n", "<leader>tf", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>tg", ":TagbarToggle<CR>", opts)

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover({border='rounded'})<CR>", opts)
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

keymap("n", "lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
keymap("n", "la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
