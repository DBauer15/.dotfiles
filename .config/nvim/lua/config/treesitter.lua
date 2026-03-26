require("nvim-treesitter").setup({
    ensure_installed = { "python", "lua", "cpp" },
    auto_install = true,
    highlight = { enable = true },
})
