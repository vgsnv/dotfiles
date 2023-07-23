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
                height = 0.5,
                preview_cutoff = 120,
                prompt_position = "bottom",
                width = 0.5
            }
        }
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function()
                        vim.cmd('normal vbd')
                    end
                },
                ["n"] = {
                    -- your custom normal mode mappings
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

telescope.load_extension("file_browser")

vim.keymap.set('n', 'ff', function()
    builtin.find_files()
end)

vim.keymap.set('n', ';r', function()
    builtin.live_grep()
end)

vim.keymap.set('n', '<C-e>', function()
    builtin.oldfiles({
        initial_mode = "normal"
    })
end)

vim.keymap.set('n', 'gd', function()
    builtin.lsp_definitions({
        initial_mode = "normal",
        show_line = false
    })
end)

vim.keymap.set('n', 'gr', function()
    builtin.lsp_references({
        initial_mode = "normal",
        show_line = false
    })
end)

vim.api.nvim_set_keymap("n", "<Leader>fr", ":Telescope oldfiles<CR>", {
    noremap = true,
    silent = true
})

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
