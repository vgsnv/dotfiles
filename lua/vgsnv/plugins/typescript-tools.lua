return {
    "pmizio/typescript-tools.nvim",
    dependencies = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
    opts = {},
    config = function()
        require("typescript-tools").setup({
            settings = {
                -- Разделение сервера для диагностики (улучшает скорость в больших проектах)
                separate_diagnostic_server = true,
                -- Публикация диагностики только при уходе из режима вставки
                publish_diagnostic_on = "insert_leave",
                -- Настройки автодополнения (как в VS Code)
                complete_function_calls = true,
                include_completions_with_insert_text = true,
                tsserver_file_preferences = {
                    -- Включает автодополнение для импортов (авто-импорт)
                    includeCompletionsForModuleExports = true,
                    -- Показывать предложения для неимпортированных типов
                    includeCompletionsForImportStatements = true
                },
                tsserver_format_options = {
                    -- Позволяет более гибко обрабатывать неполные вводы
                    allowIncompleteCompletions = true
                }
            }
        })
    end
}
