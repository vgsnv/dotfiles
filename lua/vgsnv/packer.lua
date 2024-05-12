vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lualine/lualine.nvim"
    use "karb94/neoscroll.nvim"
    use "echasnovski/mini.animate"
    use "norcalli/nvim-colorizer.lua"
    use "nvim-lua/plenary.nvim"
    use "windwp/nvim-autopairs"
    use 'nvim-tree/nvim-web-devicons'
    use "tpope/vim-fugitive"

    use {
        "folke/noice.nvim",
        requires = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"}
    }

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })

    use {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.6'
    }

    use "nvim-telescope/telescope-file-browser.nvim"

    use "numToStr/Comment.nvim"

    use "JoosepAlviste/nvim-ts-context-commentstring"

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {{'neovim/nvim-lspconfig'}, {'hrsh7th/nvim-cmp'}, {'hrsh7th/cmp-nvim-lsp'}, {'L3MON4D3/LuaSnip'},
                    {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'}, {'onsails/lspkind.nvim'}}
    }

    -- React
    use "mfussenegger/nvim-lint"
    use "stevearc/conform.nvim"

    -- theme
    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }
    use {
        "rose-pine/neovim",
        as = 'rose-pine'
    }

    use({
        "projekt0n/github-nvim-theme",
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

        end
    })

end)
