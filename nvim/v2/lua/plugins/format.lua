if vim.g.vscode then
	return {}
else
	return {

		{
			"zapling/mason-conform.nvim",
			dependencies = {
				"williamboman/mason.nvim",
			},
			opts = {},
		},

		{
			"stevearc/conform.nvim",
			opts = {
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					go = { "goimports", "gofumpt" },
					-- Use the "*" filetype to run formatters on all filetypes.
					["*"] = { "trim_whitespace", "trim_newlines" },
				},
				-- Set this to change the default values when calling conform.format()
				-- This will also affect the default values for format_on_save/format_after_save
				default_format_opts = {
					lsp_format = "fallback",
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			},
		},
	}
end
