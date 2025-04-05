if vim.g.vscode then
    return {}
else
    return {

        -- mason.nvim: Easily install and manage LSP servers, DAP servers, linters, and formatters.
        {
            "williamboman/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            },
        },
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                "williamboman/mason.nvim",
            },
            opts = {
                ensure_installed = {"gopls", "lua_ls"},
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                    gopls = function()
                        require('lspconfig').gopls.setup {
                            cmd = {"gopls", "serve"},
                            settings = {
                                gopls = {
                                    gofumpt = true,
                                    experimentalPostfixCompletions = true,
                                    analyses = {
                                        unusedparams = true,
                                        shadow = true,
                                    },
                                    staticcheck = true,
                                    codelenses = {
                                        generate = true, -- show the `go generate` lens.
                                        gc_details = true, -- Show a code lens toggling the display of gc's choices.
                                        test = true,
                                        tidy = true,
                                        vendor = true,
                                        regenerate_cgo = true,
                                        upgrade_dependency = true,
                                    },
                                },
                            },
                            init_options = {
                                usePlaceholders = true,
                            },
                            capabilities = require('blink.cmp').get_lsp_capabilities(),
                        }
                    end,
                }
            },
        },

        {
            'neovim/nvim-lspconfig',
            dependencies = {
                "williamboman/mason-lspconfig.nvim",
                "williamboman/mason.nvim",
            },
            config = function()
                vim.diagnostic.config({
                    virtual_lines = {
                        current_line = true,
                    },
                    virtual_text = false,
                    signs = {
                        text = {
                            [vim.diagnostic.severity.ERROR] = "󰅙",
                            [vim.diagnostic.severity.WARN] = "",
                            [vim.diagnostic.severity.INFO] = "󰋼",
                            [vim.diagnostic.severity.HINT] = "󰌵",
                        },
                    },
                })
            end
        },

        -- fidget.nvim: Extensible UI for Neovim notifications and LSP progress messages. 
        {
            "j-hui/fidget.nvim",
            opts = {
                notification = {
                    window = {
                        winblend = 0,
                    },
                },
            },
        },

        --  vim-illuminate: automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
        {
            "RRethy/vim-illuminate",
            event = "VeryLazy",
        },
    }
end
