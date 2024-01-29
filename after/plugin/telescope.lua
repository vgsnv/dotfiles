local status, telescope = pcall(require, "telescope")
if (not status) then
    return
end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require"telescope".extensions.file_browser.actions

telescope.setup {
    defaults = {
        preview = false,
        file_ignore_patterns = {"node_modules"},
        layout_config = {
            horizontal = {
                height = 0.77,
                width = 0.90,
                preview_cutoff = 140,
                prompt_position = "bottom"
            }
        }
    },

    pickers = {
        lsp_references = {
            preview = true,
            layout_config = {
                horizontal = {
									height = 0.77,
									width = 0.90,
									preview_cutoff = 120,
                }
            }
        }
    },

    extensions = {
        file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    ["<C-w>"] = function()
                        vim.cmd('normal vbd')
                    end
                },
                ["n"] = {
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd('startinsert')
                    end
                }
            }
        }
    }
}

builtin = require('telescope.builtin')

-- telescope.load_extension("file_browser")
telescope.load_extension("recent_files")


vim.keymap.set('n', 'ff', function()
    builtin.find_files()
end)

vim.keymap.set('n', ';r', function()
    builtin.live_grep({
        only_cwd = true,
        preview = true,
        layout_config = {
            horizontal = {
                height = 0.77,
                width = 0.64,
                prompt_position = "bottom",
            }
        }
    })
end)

vim.keymap.set("n", "<C-e>", function()
    telescope.extensions.recent_files.pick({
        noremap = true,
        silent = true,
        only_cwd = true
    })
end)

vim.keymap.set('n', 'gd', function()
    builtin.lsp_references({
        initial_mode = "normal",
        show_line = false
    })
end)

vim.keymap.set('n', 'gr', function()
    builtin.treesitter({
        initial_mode = "normal",
        show_line = false
    })
end)

vim.keymap.set("n", "sf", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",

        layout_config = {
            height = 40
        }
    })
end)
