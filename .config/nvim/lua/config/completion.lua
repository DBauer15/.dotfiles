local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"]   = cmp.mapping.scroll_docs(-4),
        ["<C-f>"]   = cmp.mapping.scroll_docs(4),
        ["<C-k>"]   = cmp.mapping.select_prev_item(),
        ["<C-j>"]   = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]    = cmp.mapping.confirm({ select = true }),
        ["<Tab>"]   = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            else fallback() end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            else fallback() end
        end, { "i", "s" }),
    }),

    formatting = {
        fields = { "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                buffer   = "[Buffer]",
                path     = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    }),
})
