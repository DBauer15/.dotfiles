-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- LSP
    { "williamboman/mason.nvim",            config = true },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig",              config = function() require("config.lsp") end },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function() require("config.completion") end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = function() require("config.treesitter") end,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("config.telescope") end,
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("config.git") end,
    },

    -- Lua Line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() require("config.lualine") end,
    },

    -- Color schemes
    { "EdenEast/nightfox.nvim" },
    { "folke/tokyonight.nvim" },

}, {
    -- lazy.nvim options
    ui = { border = "rounded" },
    performance = {
        rtp = {
            -- disable some built-in plugins we don't need
            disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor" },
        },
    },
})
