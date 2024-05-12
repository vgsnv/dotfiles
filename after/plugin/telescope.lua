local status, telescope = pcall(require, "telescope")
if (not status) then
    return
end

local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

telescope.setup {
    defaults = {
        file_ignore_patterns = {"node_modules"},
        preview = false,
        layout_config = {
            height = 0.5,
            preview_width = 0.6,
            width = 0.9
        }
    },

    pickers = {
        colorscheme = {
            enable_preview = true
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
            preview = false,
            layout_config = {
                width = 40,
                height = 12
            }
        }
    },

    extensions = {
        file_browser = {
            display_stat = false
        },
        recent_files = {
            initial_mode = "normal",
            theme = 'cursor',
            only_cwd = true,
            path_display = {"tail"},
            preview = false
        }
    }

}

vim.keymap.set('n', '<C-e>', function()
    builtin.oldfiles()
end)


vim.keymap.set("n", "sf", function()
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
                height = 16
            }
        }
    })
end)

telescope.load_extension("file_browser")
