local keymap = vim.keymap

keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

keymap.set('i', 'jj', '<Esc>')
keymap.set('i', 'kk', '<Esc>')
keymap.set('i', 'll', '<Esc>')

keymap.set('i', '<leader>w', '<Esc>:write<CR>')
keymap.set('n', '<leader>w', ':write<CR>')







