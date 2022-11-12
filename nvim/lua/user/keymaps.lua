local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Better control of neovim
vim.cmd [[
	cnoreabbrev W! w! !sudo tee %
	cnoreabbrev Wq wq !sudo tee %
	cnoreabbrev WQ wq !sudo tee %
	cnoreabbrev W w !sudo tee %
	cnoreabbrev Q! q!
	cnoreabbrev Qall! qall!
	cnoreabbrev wQ wQ
	cnoreabbrev Q q
	cnoreabbrev Qall qall
]]

-- clear hlsearch
keymap("n", "<leader><space>", ":noh<CR>", opts)

-- Split windows
keymap("n", "<leader>s", ":split<CR>", opts)
keymap("n", "<leader>v", ":vsplit<CR>", opts)

-- Better window navigation
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

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

keymap("n", "<C-g>", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
