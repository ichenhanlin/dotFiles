vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "find files" })
vim.keymap.set(
	"n",
	"<leader>fa",
	"<cmd> Telescope find_files follow=true no_ignore=true hiddent=true <CR>",
	{ desc = "find all files" }
)
vim.keymap.set("n", "<leader>fg", "<cmd> Telescope live_grep <CR>", { desc = "live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "find buffers" })
vim.keymap.set("n", "<leader>tk", "<cmd> Telescope keymaps <CR>", { desc = "show keys" })
vim.keymap.set("n", "<leader>fc", "<cmd> Telescope conflicts <CR>", { desc = "find git conflicts" })
