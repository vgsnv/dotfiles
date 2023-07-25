local keymap = vim.keymap

vim.g.mapleader = "\\"
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Delete a word backwards
keymap.set('n', 'dw', 'daw')


keymap.set('i', 'jj', '<Esc>')
keymap.set('i', 'kk', '<Esc>')
keymap.set('i', '<leader>w', '<esc>:w<cr>')
keymap.set('i', '<C-s>', '<esc>:w<cr>')
keymap.set('n', '<leader>w', ':w<cr>')
keymap.set("n", "<leader>re", ":TypescriptRemoveUnused<CR> <BAR> :TypescriptOrganizeImports<CR>")


-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Split window
keymap.set('n', '<leader>ss', ':split<Return><C-w>w')
keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-l>', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')