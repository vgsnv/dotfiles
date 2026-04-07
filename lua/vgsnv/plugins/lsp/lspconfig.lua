return {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {"antosha417/nvim-lsp-file-operations", config = true},
        {"folke/neodev.nvim", opts = {}}
    },
    config = function()
        local lspconfig = require("lspconfig");
        local mason_lspconfig = require("mason-lspconfig");
        local cmp_nvim_lsp = require("cmp_nvim_lsp");
        local keymap = vim.keymap;
        local opts = {noremap = true, silent = true};
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = {buffer = ev.buf, silent = true};
                vim.api.nvim_buf_create_user_command(ev.buf, "OrganizeImports",
                                                     function()
                    local params = {
                        command = "_typescript.organizeImports",
                        arguments = {vim.api.nvim_buf_get_name(0)}
                    };
                    local result = vim.lsp.buf_request_sync(0,
                                                            "workspace/executeCommand",
                                                            params, 1000);
                    if not result then
                        vim.notify("Organizing imports failed");
                    end
                end, {});
                opts.desc = "Show LSP references";
                keymap.set("n", "gh", "<cmd>Telescope lsp_references<CR>", opts);
                opts.desc = "Show LSP definitions";
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts);
                opts.desc = "Show LSP implementations";
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>",
                           opts);
                opts.desc = "Show LSP type definitions";
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>",
                           opts);
                opts.desc = "See available code actions";
                keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action,
                           opts);
                opts.desc = "Smart rename";
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts);
                opts.desc = "Remove unused imports";
                keymap.set("n", "<leader>ri", ":OrganizeImports<CR>", opts);
                opts.desc = "Telescope treesitter";
                keymap.set("n", "rt", "<cmd>Telescope treesitter<CR>", opts);
                opts.desc = "Show buffer diagnostics";
                keymap.set("n", "<leader>D",
                           "<cmd>Telescope diagnostics bufnr=0<CR>", opts);
                opts.desc = "Show line diagnostics";
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts);
                opts.desc = "Go to previous diagnostic";
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts);
                opts.desc = "Go to next diagnostic";
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts);
                opts.desc = "Show documentation for what is under cursor";
                keymap.set("n", "K", vim.lsp.buf.hover, opts);
                opts.desc = "Restart LSP";
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts);
            end
        });
        local capabilities = cmp_nvim_lsp.default_capabilities();
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "\61527 ",
                    [vim.diagnostic.severity.WARN] = "\61553 ",
                    [vim.diagnostic.severity.HINT] = "\985120 ",
                    [vim.diagnostic.severity.INFO] = "\61530 "
                }
            }
        });
        vim.lsp.config("*", {capabilities = capabilities});
        mason_lspconfig.setup({
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({capabilities = capabilities});
                end
            }
        });
    end
};
