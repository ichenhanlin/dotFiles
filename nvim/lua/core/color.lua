vim.cmd("colorscheme gruvbox")
vim.cmd("highlight ColorColumn ctermbg=0 guibg=grey")
vim.opt.termguicolors=true
vim.opt.background="dark"

local yank = vim.api.nvim_create_augroup("highlight_yank", {clear = true})
vim.api.nvim_create_autocmd( "TextYankPost", {
    pattern = '*',
    group = yank,
    desc = "highlight the yank text",
    callback=function ()
        pcall(vim.highlight.on_yank, {timeout=100})
    end,
})