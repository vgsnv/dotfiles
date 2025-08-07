return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {"                                                     ",
                                        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                                        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                                        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                                        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                                        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                                        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                                        "                                                     "}

        -- Set menu
        dashboard.section.buttons.val = {dashboard.button("ss", "Split window"),
                                         dashboard.button("sx", "Close split window"),
                                         dashboard.button("gh", "Show references"),
                                         dashboard.button("gd", "Show definitions"),
                                         dashboard.button("gi", "Show implementations"),
                                         dashboard.button(";ri", "Remove Unused imports"),
                                         dashboard.button(";rt", "treesitter"), dashboard.button(";rn", "Smart rename"),
                                         dashboard.button(";ca", "See available code actions"),
                                         dashboard.button("sf", "Show filebrowser"),
                                         dashboard.button(";b", "NvimTreeToggle"),
                                         dashboard.button(";ff", "Show find files"),
                                         dashboard.button("c-e", "oldfiles"), dashboard.button("sg", "live_grep"),
                                         dashboard.button("sc", "grep_string"), dashboard.button(";ct", "colorscheme"),
                                         dashboard.button(";l", "Trigger linting for current file")}

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
}
