local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Insert mode
vim.keymap.set("i", "jk", "<Esc>", opts)

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-w>\\", "<C-w>|", opts)

-- Resize splits
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Terminal: easy escape
vim.keymap.set("t", "<C-w>", "<C-\\><C-n>", opts)

-- Clear search highlight
vim.keymap.set("n", "<C-/>", ":nohlsearch<CR>", opts)
