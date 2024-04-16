local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


null_ls.setup({
    sources = {
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        -- null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines.with({
            extra_args = {"-m", "120"},
        }),
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.refactoring,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
