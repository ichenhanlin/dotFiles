-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.env.JAVA_HOME = '/usr/local/java/java-11'

require 'lspconfig'.jdtls.setup({
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name="JavaSE-11",
                        path="/usr/local/java/java-11"
                    },
                    {
                        name="JavaSE-1.8",
                        path="/usr/local/java/java-8"
                    },
                }
            },
            contentProvider = { preferred = 'fernflower' },
            signatureHelp = { enabled = true },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
        }
    },
    capabilities = capabilities,
})
