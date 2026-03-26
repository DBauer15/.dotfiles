-- Clipboard & mouse
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Tabs & indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"      -- always show, prevents layout shifts
vim.opt.scrolloff = 8           -- keep cursor away from edges

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Misc
vim.opt.updatetime = 250        -- faster CursorHold events (used by gitsigns etc.)
vim.opt.timeoutlen = 300        -- faster which-key / keymap resolution
vim.opt.undofile = true         -- persistent undo across sessions
