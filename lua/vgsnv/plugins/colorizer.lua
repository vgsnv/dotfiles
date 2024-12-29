return {
    -- require('nvim-highlight-colors').setup({})
    'brenoprata10/nvim-highlight-colors',
    event = "VeryLazy",
    config = function()

        local colorizer = require("nvim-highlight-colors")

        colorizer.setup({})

    end
}
