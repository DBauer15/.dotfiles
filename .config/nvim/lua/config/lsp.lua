require("mason").setup({
    ui = { border = "rounded", icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } },
})

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd", "cmake", "cssls", "dockerls", "html", "jsonls", "pylsp" },
    automatic_installation = true,
})

-- Diagnostics
vim.diagnostic.config({
    virtual_text = { prefix = "●" },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
            [vim.diagnostic.severity.HINT]  = "󰌵 ",
        },
    },
    underline = true,
    update_in_insert = false,
    float = { border = "rounded", source = true },
})

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d",       vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d",       vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Keymaps + inlay hints via LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(event)
        local buf  = event.buf
        local opts = { noremap = true, silent = true, buffer = buf }

        vim.keymap.set("n", "gD",        vim.lsp.buf.declaration,     opts)
        vim.keymap.set("n", "gd",        vim.lsp.buf.definition,      opts)
        vim.keymap.set("n", "gi",        vim.lsp.buf.implementation,  opts)
        vim.keymap.set("n", "gr",        vim.lsp.buf.references,      opts)
        vim.keymap.set("n", "K",         vim.lsp.buf.hover,           opts)
        vim.keymap.set("n", "<C-k>",     vim.lsp.buf.signature_help,  opts)
        vim.keymap.set("n", "<space>D",  vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename,          opts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action,     opts)
        vim.keymap.set("n", "<space>cf", function() vim.lsp.buf.format({ async = true }) end, opts)
        vim.keymap.set("n", "<space>ih", function()
            vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }),
                { bufnr = buf }
            )
        end, vim.tbl_extend("force", opts, { desc = "Toggle inlay hints" }))

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = buf })
        end
    end,
})

-- 0.11 native server config via vim.lsp.config / vim.lsp.enable
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Simple servers: just pass capabilities
for _, server in ipairs({ "clangd", "cmake", "cssls", "dockerls", "html", "jsonls", "pylsp" }) do
    vim.lsp.config(server, { capabilities = capabilities })
    vim.lsp.enable(server)
end

-- lua_ls needs extra settings to understand the Neovim runtime
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime     = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace   = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
            telemetry   = { enable = false },
            hint        = { enable = true },
        },
    },
})
vim.lsp.enable("lua_ls")
