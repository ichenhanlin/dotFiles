-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.scrolloff = 8


-- key mapping
vim.keymap.set("n", "<Leader>gD", function() require("vscode").action("editor.action.revealDeclaration") end)
vim.keymap.set("n", "<Leader>gd", function() require("vscode").action("editor.action.revealDefinition") end)
vim.keymap.set("n", "<Leader>rn", function() require("vscode").action("editor.action.rename") end)
vim.keymap.set("n", "<Leader>gi", function() require("vscode").action("editor.action.goToImplementation") end)
vim.keymap.set("n", "<Leader>ls", function() require("vscode").action("editor.action.triggerParameterHints") end)
vim.keymap.set("n", "<Leader>D", function() require("vscode").action("editor.action.goToTypeDefinition") end)
vim.keymap.set("n", "<Leader>ca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<Leader>gr", function() require("vscode").action("editor.action.goToReferences") end)
vim.keymap.set("n", "<Leader>rf", function() require("vscode").action("editor.action.refactor") end)
vim.keymap.set("n", "<Leader>lr", function() require("vscode").action("references-view.findReferences") end)
vim.keymap.set("n", "]d", function() require("vscode").action("editor.action.marker.next") end)
vim.keymap.set("n", "[d", function() require("vscode").action("editor.action.marker.prev") end)
vim.keymap.set("n", "<Leader>ff", function() require("vscode").action("find-it-faster.findFiles") end)
vim.keymap.set("n", "<Leader>fg", function() require("vscode").action("find-it-faster.findWithinFiles") end)
vim.keymap.set("n", "<Leader>fb", function() require("vscode").action("workbench.files.action.focusOpenEditorsView") end)
vim.keymap.set("n", "<Leader>e", function() require("vscode").action("workbench.files.action.focusFilesExplorer") end)
vim.keymap.set("n", "<Leader>s", function() require("vscode").action("outline.focus") end)
vim.keymap.set("n", "<Leader>fs", function() require("vscode").action("workbench.action.gotoSymbol") end)
