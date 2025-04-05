return {
	-- colorschema
	{
		"catppuccin/nvim",
		cond = function()
			return not vim.g.vscode
		end,
		lazy = false,
		name = "catppuccin",
		priority = 1000,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		cond = function()
			return not vim.g.vscode
		end,
		opts = {
			extensions = {
				"lazy",
				"mason",
				"nvim-tree",
				"nvim-dap-ui",
				"quickfix",
				-- "symbols-outline",
				-- "trouble"
			},
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- "f-person/git-blame.nvim",
		},
	},

	--  Display a line as the colorcolumn
	{
		"xiyaowong/virtcolumn.nvim",
		event = "VeryLazy",
		cond = function()
			return not vim.g.vscode
		end,
	},

	-- A collection of small QoL plugins for Neovim.
	{
		"folke/snacks.nvim",
		priority = 1000,
		cond = function()
			return not vim.g.vscode
		end,
		lazy = false,
		---@type snacks.Config
		opts = {
			indent = { enabled = true },
			input = { enabled = true },
			scroll = { enabled = true },
		},
	},

	-- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
	},
}
