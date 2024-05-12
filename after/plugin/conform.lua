require("conform").setup({
    formatters_by_ft = {
        javascript = {"eslint_d"},
        typescript = {"eslint_d"},
        javascriptreact = {"eslint_d"},
        typescriptreact = {"eslint_d"},
        css = {"prettier"},
        html = {"prettier"},
        json = {"prettier"},
        yaml = {"prettier"},
        markdown = {"prettier"},
        graphql = {"prettier"},
        liquid = {"prettier"},
        lua = {"stylua"}
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000
    }
})
