return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {"nvim-lua/plenary.nvim", {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    }, "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim", "nvim-telescope/telescope-file-browser.nvim"},
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local transform_mod = require("telescope.actions.mt").transform_mod

        local trouble = require("trouble")
        local trouble_telescope = require("trouble.providers.telescope")
        local trouble_telescope_sources = require("trouble.sources.telescope")

        local function telescope_buffer_dir()
            return vim.fn.expand('%:p:h')
        end

        -- or create your custom action
        local custom_actions = transform_mod({
            open_trouble_qflist = function(prompt_bufnr)
                trouble.toggle("quickfix")
            end
        })

        telescope.setup({
            defaults = {
                file_ignore_patterns = {"node_modules"},
                path_display = {"smart"},
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                        ["<C-t>"] = trouble_telescope_sources.open
                    }
                }
            },

            pickers = {
                colorscheme = {
                    enable_preview = true,
                    initial_mode = "normal",
                },
                lsp_implementations = {
                    initial_mode = "normal",
                    preview = false,
                    show_line = false,
                    theme = 'cursor'
                },
                lsp_references = {
                    initial_mode = "normal",
                    path_display = {"tail"},
                    preview = true,
                    show_line = true,
                    sorting_strategy = "ascending",
                    theme = 'cursor',
                    layout_config = {
                        prompt_position = "top"
                    }

                },
                oldfiles = {
                    initial_mode = "normal",
                    theme = 'cursor',
                    only_cwd = true,
                    path_display = {"tail"},
                    previewer = false,
                    layout_config = {
                        width = 40,
                        height = 12
                    }
                }
            }

        })

        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "sf", function()
            telescope.extensions.file_browser.file_browser({
                path = '%:p:h',
                grouped = true,
                theme = "dropdown",
                hijack_netrw = true,
                path_display = {"tail"},
                sorting_strategy = "ascending",
                cwd = telescope_buffer_dir(),
                respect_gitignore = false,
                hidden = true,
                previewer = false,
                initial_mode = "normal",
                layout_config = {
                    horizontal = {
                        width = 80,
                        height = 26
                    }
                }
            })
        end)



        keymap.set("n", "<leader>ct", "<cmd>Telescope colorscheme<cr>", {
            desc = "Change Colorscheme"
        })
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {
            desc = "Fuzzy find files in cwd"
        })
        keymap.set("n", "<C-e>", "<cmd>Telescope oldfiles<cr>", {
            desc = "Fuzzy find recent files"
        })
        keymap.set("n", "<leader>fl", "<cmd>Telescope loclist<cr>", {
            desc = "Fuzzy find recent files"
        })

        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", {
            desc = "Find string in cwd"
        })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {
            desc = "Find string under cursor in cwd"
        })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", {
            desc = "Find todos"
        })

    end
}
