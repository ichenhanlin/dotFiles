vim.keymap.set("n", "<leader>hw", "<cmd> HopWord <CR>", { desc = "hint all words in your buffer" })
vim.keymap.set(
	"n",
	"<leader>hc",
	"<cmd> HopChar2 <CR>",
	{ desc = "Prompts you for two keys to type and hint the bigram in the buffer" }
)
vim.keymap.set(
	"n",
	"<leader>hp",
	"<cmd> HopPattern <CR>",
	{ desc = "A powerful command that mixes the default Neovim search (/) with hinting" }
)
