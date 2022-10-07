local keymap = vim.keymap

keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

--keymap.set('n', 'ss', ':split<Return><C-w>w')
--keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

keymap.set('i', 'jj', '<Esc>')
keymap.set('i', 'kk', '<Esc>')

keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-l>', '<C-w>l')

keymap.set('i', '<leader>w', '<Esc>:write<CR>')
keymap.set('n', '<leader>w', ':write<CR>')


-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')