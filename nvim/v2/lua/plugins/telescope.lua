if vim.g.vscode then
	return {}
else
	return {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},

		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-fzf-native.nvim",
				"Snikimonkd/telescope-git-conflicts.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
			},
			config = function()
				require("telescope").setup({
					defaults = {
						mappings = {
							i = {
								["<C-j>"] = require("telescope.actions").move_selection_next,
								["<C-k>"] = require("telescope.actions").move_selection_previous,
							},
						},
					},
					extensions = {
						fzf = {
							fuzzy = true, -- false will only do exact matching
							override_generic_sorter = true, -- override the generic sorter
							override_file_sorter = true, -- override the file sorter
							case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						},
					},
				})

				require("telescope").load_extension("fzf")
				require("telescope").load_extension("conflicts")
				require("telescope").load_extension("ui-select")
			end,
		},

		{
			"aznhe21/actions-preview.nvim",
			dependencies = {
				"nvim-telescope/telescope.nvim",
			},
			opts = {},
		},
	}
end
