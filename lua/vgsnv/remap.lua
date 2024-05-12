local keymap = vim.keymap

vim.g.mapleader = ";"
keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("n", "s", '<nop>')

-- Удалить слово
keymap.set('n', 'dw', 'daw')

-- Перейти в нормальный режим
keymap.set('i', 'jj', '<Esc>')
keymap.set('i', 'kk', '<Esc>')

-- Сохранить
keymap.set('i', '<leader>w', '<esc>:wa<cr>')
keymap.set('n', '<leader>w', ':wa<cr>')

-- Выйти без сохранения
keymap.set('n', '<leader>qu', ':q!<cr>')
-- Выйти и всё сохранить
keymap.set('n', '<leader>qo', ':waq<cr>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Split window
-- keymap.set('n', '<leader>ss', ':split<Return><C-w>w')
keymap.set('n', 'ss', ':vsplit<Return><C-w>w')

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

keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>')

-- nnoremap <silent> <leader>gg :LazyGit<CR>