vim.cmd("colorscheme catppuccin")
vim.opt.background="dark"

-- highlight yank
local yank = vim.api.nvim_create_augroup("highlight_yank", {clear = true})
vim.api.nvim_create_autocmd( "TextYankPost", {
    pattern = '*',
    group = yank,
    desc = "highlight the yank text",
    callback=function ()
        pcall(vim.highlight.on_yank, {timeout=100})
    end,
})