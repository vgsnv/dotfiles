local opt = vim.opt
local api = vim.api

opt.relativenumber = true
opt.number = true

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
opt.autoindent = true

opt.wrap = false -- No Wrap lines

opt.title = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.scrolloff = 10
opt.shell = 'fish'
opt.backupskip = {'/tmp/*', '/private/tmp/*'}
opt.inccommand = 'split'
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.breakindent = true
opt.swapfile = false
opt.termguicolors = true
opt.incsearch = true
opt.backspace = {'start', 'eol', 'indent'}
opt.path:append{'**'} -- Finding files - Search down into subfolders
opt.wildignore:append{'*/node_modules/*'}

-- Turn off paste mode when leaving insert
api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = "set nopaste"
})
-- Add asterisks in block comments
opt.formatoptions:append{'r'}

opt.cursorline = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
-- opt.background = 'light'
