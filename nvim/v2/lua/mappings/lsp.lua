local present = pcall(require, "nvim-treesitter.configs")
if present then
	vim.keymap.set("n", "<leader>gr", "<cmd> Telescope lsp_references <CR>", { desc = "find references" })
	vim.keymap.set("n", "<leader>gi", "<cmd> Telescope lsp_implementations <CR>", { desc = "go to implementation" })
	vim.keymap.set("n", "<leader>gd", "<cmd> Telescope lsp_definitions <CR>", { desc = "go to definition" })
	vim.keymap.set(
		"n",
		"<leader>gs",
		"<cmd> Telescope lsp_document_symbols <CR>",
		{ desc = "Lists LSP document symbols in the current buffer" }
	)
	vim.keymap.set(
		"n",
		"<leader>ge",
		"<cmd> Telescope diagnostics bufnr=0 <CR>",
		{ desc = "Lists Diagnostics for current buffer" }
	)
	vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions, { desc = "code action" })
else
	vim.keymap.set("n", "<leader>gd", function()
		vim.lsp.buf.definition()
	end, { desc = "go to definition" })
	vim.keymap.set("n", "<leader>gi", function()
		vim.lsp.buf.implementation()
	end, { desc = "go to implementation" })
	vim.keymap.set("n", "<leader>gr", function()
		vim.lsp.buf.references()
	end, { desc = "find references" })
	vim.keymap.set({ "v", "n" }, "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, { desc = "code action" })
end
vim.keymap.set("n", "<leader>gD", function()
	vim.lsp.buf.declaration()
end, { desc = "go to declaration" })
vim.keymap.set("n", "<leader>rn", function()
	vim.lsp.buf.rename()
end, { desc = "lsp rename" })
vim.keymap.set("n", "<leader>K", function()
	vim.lsp.buf.hover()
end, { desc = "lsp hover" })
vim.keymap.set("n", "<leader>ls", function()
	vim.lsp.buf.signature_help()
end, { desc = "lsp show signature help" })
vim.keymap.set("n", "<leader>f", function()
	vim.diagnostic.open_float()
end, { desc = "show diagnostic in float window" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev()
end, { desc = "go to prev error" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next()
end, { desc = "go to next error" })
