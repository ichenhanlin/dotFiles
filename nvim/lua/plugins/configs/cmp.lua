local present, cmp = pcall(require, "cmp")

if not present then
    return
end

local lspkind = require('lspkind')
local luasnip = require("luasnip")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- gray
vim.cmd("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
-- blue
vim.cmd("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6")
vim.cmd("highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch")
-- light blue
vim.cmd("highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE")
vim.cmd("highlight! link CmpItemKindInterface CmpItemKindVariable")
vim.cmd("highlight! link CmpItemKindText CmpItemKindVariable")
-- pink
vim.cmd("highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0")
vim.cmd("highlight! link CmpItemKindMethod CmpItemKindFunction")
-- front
vim.cmd("highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4")
vim.cmd("highlight! link CmpItemKindProperty CmpItemKindKeyword")
vim.cmd("highlight! link CmpItemKindUnit CmpItemKindKeyword")

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        })
    },
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<Down>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<Up>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
}


-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        }
    )
})
