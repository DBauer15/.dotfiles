-- search files, even hidden ones
vim.keymap.set('n', '<leader>ff', ':lua require"telescope.builtin".find_files({hidden=true})<CR>', {})
vim.keymap.set('n', '<leader>gg', ':lua require"telescope.builtin".live_grep({hidden=true})<CR>', {})
