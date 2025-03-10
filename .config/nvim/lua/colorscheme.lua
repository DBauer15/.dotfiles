-- define your colorscheme here
vim.defer_fn(function()
    local colorscheme = 'aura-dark'
    local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

    if not is_ok then
        vim.notify('colorscheme ' .. colorscheme .. ' not found!')
        return
    end
end, 0)
