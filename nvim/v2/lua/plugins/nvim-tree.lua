if vim.g.vscode then
    return {}
else
    return {
        {
            'kyazdani42/nvim-tree.lua',
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            opts = {
                hijack_cursor = true,
                disable_netrw = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = false,
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                    severity = {
                        min = vim.diagnostic.severity.ERROR,
                        max = vim.diagnostic.severity.ERROR,
                    }
                }
            },
        },

    }
end
