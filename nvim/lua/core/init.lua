-- basic setting
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.smarttab=true
vim.opt.relativenumber=true
vim.opt.number=true
vim.opt.cursorline=true
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.smartcase=true
vim.opt.ignorecase=true
vim.opt.hidden=true
vim.opt.errorbells=false
vim.opt.wrap=false
vim.opt.swapfile=false
vim.opt.backup=false
vim.opt.undofile=true
vim.opt.wildmenu=true
vim.opt.startofline=false
vim.opt.signcolumn="yes"
vim.opt.scrolloff=8
vim.opt.colorcolumn="120"
vim.opt.matchpairs="(:),{:},[:],《:》,〈:〉,［:］,（:）,「:」,『:』,‘:’,“:”,':',\":\""
vim.opt.undodir=vim.fn.expand("$HOME/.nvim/undodir")
vim.opt.display="lastline"
vim.opt.completeopt:append({"longest","menuone","noinsert","noselect"})
vim.opt.updatetime=50

-- color setting
require("core.color")

-- key mapping setting
vim.g.mapleader = ' '
require("core.utils").load_mappings()

-- load plugins
require("plugins")

-- commands
require("core.commands")
