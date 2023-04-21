print('load remap')
local keymap = vim.keymap

vim.g.mapleader = " "
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Delete a word backwards
keymap.set('n', 'dw', 'daw')

keymap.set('i', 'jj', '<Esc>')
keymap.set('i', 'kk', '<Esc>')