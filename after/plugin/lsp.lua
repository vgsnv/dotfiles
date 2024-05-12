local lsp_zero = require('lsp-zero')
local builtin = require('telescope.builtin')

local status, telescope = pcall(require, "telescope")
if (not status) then
    return
end

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({
        buffer = bufnr
    })

    local opts = {
        buffer = bufnr,
        silent = true
    }

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

    opts.desc = "Show documentation for what is under cursor"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "See available code actions"
    vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    vim.keymap.set('n', '<leader>ct', function()
        builtin.colorscheme()
    end, {
        buffer = bufnr
    })

    vim.keymap.set('n', 'gd', function()
        builtin.lsp_implementations()
    end)

    vim.keymap.set('n', 'gh', function()
        builtin.lsp_references()
    end)


    vim.keymap.set('n', 'gm', function()
        builtin.lsp_document_symbols({
            preview = false,
            initial_mode = "normal",
            show_line = true
        })
    end, {
        buffer = bufnr
    })

    vim.keymap.set('n', 'fe', function()
        builtin.find_files({
            path = '%:p:h',
            sorting_strategy = "ascending",
            layout_config = {
                horizontal = {
                    width = 80,
                    height = 16
                }
            }
        })
    end)

    vim.keymap.set('n', '<leader>er', function()
        builtin.live_grep({
            only_cwd = true,
            preview = true
        })
    end)

    vim.keymap.set('n', 'gt', function()
        builtin.git_status({
            show_untracked = true,
            only_cwd = true,
            preview = true,
            path_display = {"tail"},
            horizontal = {
                height = 0.77,
                width = 0.90,
                prompt_position = "bottom"
            }
        })
    end)

end)

require'lspconfig'.tsserver.setup {
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"}
}

local cmp = require('cmp')

cmp.setup({
    sources = {{
        name = 'nvim_lsp'
    }},

    confirm = {
        select = true
    },

    completion = {
        -- autocomplete = false,
        completeopt = "menu,menuone"
    },

    window = {
        completion = cmp.config.window.bordered()
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({
            select = false
        }),
        ['<C-k>'] = cmp.mapping.select_prev_item({
            behavior = 'select'
        }),
        ['<C-j>'] = cmp.mapping.select_next_item({
            behavior = 'select'
        }),

        ['<C-.>'] = cmp.mapping.complete()
    },
    formatting = {
        format = require('lspkind').cmp_format({
            maxwidth = 50,
            ellipsis_char = "..."
        })
    }
})
