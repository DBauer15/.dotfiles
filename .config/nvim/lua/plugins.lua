-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies". 
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ---------------------------------------
    -- NOTE: PUT YOUR THIRD PLUGIN HERE --
    ---------------------------------------
    
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }    
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' } 
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }        -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }          -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }       -- cmdline auto-completion
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip' 
    
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }

    use { 'Shatur/neovim-tasks', 
            requires = { 'nvim-lua/plenary.nvim' }
        }

    use { 'nvim-tree/nvim-tree.lua' }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', 
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end
        }
    use({
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
      requires = "nvim-treesitter/nvim-treesitter",
    })

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.4',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }


    -- Git status bar
    use { 'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

    -- Floating terminalasdf
    use 'voldikss/vim-floaterm'
    
    -- Surround
    use 'tpope/vim-surround'
    
    -- Sneak Search
    use 'justinmk/vim-sneak'

    -- EasyMotion
    use 'easymotion/vim-easymotion'

    -- Git signs
    use 'lewis6991/gitsigns.nvim'

    -- Args text objects
    use 'vim-scripts/argtextobj.vim'

    -- Git plugin
    use 'tpope/vim-fugitive'

    -- Code comments
    use 'tpope/vim-commentary'

    -- Unimpaired
    -- use { 'tummetott/unimpaired.nvim',
    --        config = function()
    --            require('unimpaired').setup {}
    --        end
    --    }

    -- Color Schemes
    use 'folke/tokyonight.nvim'
    use 'arcticicestudio/nord-vim'
    use {
      'daltonmenezes/aura-theme',
      rtp = 'packages/neovim',
      config = function()
        --vim.cmd('colorscheme aura-dark-soft-text') -- Or any Aura theme available
        --require('colorscheme')
      end
    }

    -- Avante
    use 'stevearc/dressing.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'MunifTanjim/nui.nvim'
    use 'MeanderingProgrammer/render-markdown.nvim'
    use {
        'yetone/avante.nvim',
        tag = 'v0.0.22',
        run = 'make'
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
