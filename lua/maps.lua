local keymap = vim.keymap


-- Increment/decrement
keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
