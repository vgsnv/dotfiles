require"telescope".setup {
    defaults = {
        initial_mode = "normal",
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
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', function()
    builtin.find_files()
end)

vim.keymap.set('n', '<C-e>', builtin.oldfiles, {})
vim.keymap.set('n', 'gh', function()
    builtin.lsp_references({
        show_line = false
    })
end)

vim.api.nvim_set_keymap("n", "<Leader>fr", ":Telescope oldfiles<CR>", {
    noremap = true,
    silent = true
})
