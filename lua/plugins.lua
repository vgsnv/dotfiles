-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'

	use 'kyazdani42/nvim-tree.lua'

	use 'nvim-telescope/telescope.nvim'

	use 'ggandor/lightspeed.nvim'

  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/nvim-cmp' -- Completion
	use 'onsails/lspkind-nvim'

	use 'ray-x/lsp_signature.nvim'
	use 'neovim/nvim-lspconfig'

	use 'jose-elias-alvarez/null-ls.nvim'
	use 'MunifTanjim/prettier.nvim'

	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	use 'nvim-lualine/lualine.nvim' -- Statusline
	use "ellisonleao/gruvbox.nvim"
	use "EdenEast/nightfox.nvim" 

	use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

	use 'numToStr/Comment.nvim'

end)

