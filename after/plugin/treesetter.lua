require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {"javascript", "typescript", "c", "lua", "vim", "query"},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,

        additional_vim_regex_highlighting = false
    },

    autotag = {
        enable = true
    },
    context_commentstring = {
        config = {
            javascript = {
                __default = '// %s',
                jsx_element = '{/* %s */}',
                jsx_fragment = '{/* %s */}',
                jsx_attribute = '// %s',
                comment = '// %s'
            },
            typescript = {
                __default = '// %s',
                __multiline = '/* %s */'
            }
        }
    }

}
