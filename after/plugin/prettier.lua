local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
