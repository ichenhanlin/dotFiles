local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
require "lspconfig".pylsp.setup{
    capabilities = capabilities,
}
require "lspconfig".pylsp.setup{
    capabilities = capabilities,
}
