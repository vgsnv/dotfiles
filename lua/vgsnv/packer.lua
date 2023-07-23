-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'nvim-lualine/lualine.nvim' -- Statusline

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- theme
    use {
        'rose-pine/neovim',
        as = 'rose-pine'
    }
    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }

    use({
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                options = {
                    styles = {
                        comments = 'bold', -- Value is any valid attr-list value `:help attr-list`
                        functions = 'bold',
                        keywords = 'bold',
                        variables = 'bold',
                        conditionals = 'bold',
                        constants = 'bold',
                        numbers = 'bold',
                        operators = 'bold',
                        strings = 'bold',
                        types = 'bold'
                    }
                }
            })

            vim.cmd('colorscheme github_dark')
        end
    })

    use {
        'svrana/neosolarized.nvim',
        requires = {'tjdevries/colorbuddy.nvim'}
    }

    -----------
    use 'christoomey/vim-tmux-navigator'

    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use({
        "nvim-treesitter/nvim-treesitter",
        tag = 'v0.8.5.2',
        run = ":TSUpdate"
    })

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = { -- LSP Support
        {'neovim/nvim-lspconfig'}, -- Required
        { -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end
        }, {'williamboman/mason-lspconfig.nvim'}, -- Optional
        -- Autocompletion
        {'hrsh7th/nvim-cmp'}, -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'} -- Required
        }
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
    }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use 'jose-elias-alvarez/typescript.nvim'

    use 'norcalli/nvim-colorizer.lua'
    use 'windwp/nvim-ts-autotag'

    use('neovim/nvim-lspconfig')
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    use 'nvim-tree/nvim-web-devicons'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

end)
