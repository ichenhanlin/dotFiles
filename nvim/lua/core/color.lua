vim.cmd("colorscheme gruvbox")
vim.cmd("highlight ColorColumn ctermbg=0 guibg=grey")
vim.opt.termguicolors=true
vim.opt.background="dark"

vim.api.nvim_set_hl(0, 'LspCodeLens', { link = 'DiagnosticHint', default = true })
vim.api.nvim_set_hl(0, 'LspCodeLensText', { link = 'DiagnosticInfo', default = true })
vim.api.nvim_set_hl(0, 'LspCodeLensSign', { link = 'DiagnosticInfo', default = true })
vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', { link = 'Boolean', default = true })

-- vim.api.nvim_set_hl(0, 'DiffAdd', { link = 'GruvboxGreenSign'})
-- vim.api.nvim_set_hl(0, 'DiffDelete', { link = 'GruvboxRedSign'})
-- vim.api.nvim_set_hl(0, 'DiffChange', { link = 'GruvboxAquaSign'})
-- vim.api.nvim_set_hl(0, 'DiffText', { link = 'GruvboxYellowSign'})

local yank = vim.api.nvim_create_augroup("highlight_yank", {clear = true})
vim.api.nvim_create_autocmd( "TextYankPost", {
    pattern = '*',
    group = yank,
    desc = "highlight the yank text",
    callback=function ()
        pcall(vim.highlight.on_yank, {timeout=100})
    end,
})
