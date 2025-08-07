vim.g.mapleader = ";"

local keymap = vim.keymap

-- Перейти в нормальный режим
keymap.set("i", "jk", "<Esc>", {
    desc = "Exit insert mode with jk"
})
keymap.set("i", "jj", "<Esc>", {
    desc = "Exit insert mode with jk"
})
keymap.set("i", "kk", "<Esc>", {
    desc = "Exit insert mode with jk"
})

keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("n", "s", "<nop>")

-- Удалить слово
keymap.set("n", "dw", "daw")

-- Сохранить
keymap.set("i", "<leader>w", "<esc>:wa<cr>")
keymap.set("n", "<leader>w", ":wa<cr>")

-- Выйти без сохранения
keymap.set("n", "<leader>qu", ":q!<cr>")
-- Выйти и всё сохранить
keymap.set("n", "<leader>qo", ":waq<cr>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":vsplit<Return><C-w>w", {
    desc = "Split window vertically"
})
keymap.set("n", "sx", "<cmd>close<CR>", {
    desc = "Close current split"
})

-- Move window
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-l>', '<C-w>l')

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- nnoremap <silent> <leader>gg :LazyGit<CR>
