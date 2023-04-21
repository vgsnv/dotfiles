local lsp = require('lsp-zero').preset({})


lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.format_on_save({
  servers = {
    ['lua_ls'] = {'lua'},
    ['rust_analyzer'] = {'rust'},
  }
})


lsp.setup()


local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  completion = {
		autocomplete = false,
		completeopt = "menu,menuone,noselect",
	},

  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-.>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})