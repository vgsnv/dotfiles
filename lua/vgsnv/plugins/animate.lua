return {
    "echasnovski/mini.nvim",
    event = "VeryLazy",

    config = function()
        local animate = require("mini.animate")

        animate.setup()
    end
}
