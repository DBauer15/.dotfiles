-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-- remap <leader>
vim.g.mapleader = ' '

-----------------
-- Insert mode --
-----------------
vim.keymap.set('i', 'jk', '<Esc>', opts)

-----------------
-- Normal mode --
-----------------

-- Insert new lines in normal mode 
vim.keymap.set('n', '<S-k>', '<S-o><Esc>', opts)
vim.keymap.set('n', '<S-j>', 'o<Esc>', opts)

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize -2<CR>', opts)

-- Floaterm
vim.keymap.set('n', '<leader>tt', ':FloatermToggle<cr>', opts)
vim.keymap.set('t', 'tt<leader>', '<C-\\><C-n>:FloatermToggle<cr>', opts)

-- CMake
vim.keymap.set('n', '<leader>cc', ':Task start cmake configure<cr>', opts)
vim.keymap.set('n', '<leader>cb', ':Task start cmake build<cr>', opts)
vim.keymap.set('n', '<leader>cr', ':Task start cmake run<cr>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
