-- general setting

-- go to beginning and end
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "end of line" })

-- navigate within insert mode
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "move left" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "move up" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "move right" })

vim.keymap.set("n", "<ESC>", "<cmd> noh <CR>", { desc = "no highlight" })

-- switch between windows
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "window left" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "window down" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "window up" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "window right" })
vim.keymap.set("i", "<A-h>", "<Esc><C-w>h", { desc = "window left" })
vim.keymap.set("i", "<A-j>", "<Esc><C-w>j", { desc = "window down" })
vim.keymap.set("i", "<A-k>", "<Esc><C-w>k", { desc = "window up" })
vim.keymap.set("i", "<A-l>", "<Esc><C-w>l", { desc = "window right" })

-- end general setting
if not vim.g.vscode then
	require("mappings.nvim-tree")
	require("mappings.telescope")
	require("mappings.lsp")
	require("mappings.dap")
end
require("mappings.hop")
