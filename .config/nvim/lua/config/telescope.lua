local telescope = require("telescope")
local builtin   = require("telescope.builtin")

telescope.setup({
    defaults = {
        -- Use vim regex highlighting in the previewer instead of treesitter,
        -- since telescope hasn't caught up with nvim-treesitter v1.0 yet.
        preview = {
            treesitter = false,
        },
    },
})

vim.keymap.set("n", "<leader>f", function() builtin.find_files({ hidden = true }) end)
vim.keymap.set("n", "<leader>g", function() builtin.live_grep({ hidden = true }) end)
vim.keymap.set("n", "<leader>b", function() builtin.buffers({ hidden = true }) end)
