local M = {}
M.general = {
    i = {
        -- go to  beginning and end
        ["<C-b>"] = { "<ESC>^i", "beginning of line" },
        ["<C-e>"] = { "<End>", "end of line" },

        -- navigate within insert mode
        ["<C-h>"] = { "<Left>", "move left" },
        ["<C-l>"] = { "<Right>", "move right" },
        ["<C-j>"] = { "<Down>", "move down" },
        ["<C-k>"] = { "<Up>", "move up" },
        -- switch between windows
        ["<A-h>"] = { "<C-w>h", "window left" },
        ["<A-l>"] = { "<C-w>l", "window right" },
        ["<A-j>"] = { "<C-w>j", "window down" },
        ["<A-k>"] = { "<C-w>k", "window up" },
    },
    n = {
        ["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },

        -- switch between windows
        ["<A-h>"] = { "<C-w>h", "window left" },
        ["<A-l>"] = { "<C-w>l", "window right" },
        ["<A-j>"] = { "<C-w>j", "window down" },
        ["<A-k>"] = { "<C-w>k", "window up" },

        ["<leader>s="] = {':exe "resize " . (winheight(0) * 5/4)<CR>', "increase horizental window size"},
        ["<leader>s-"] = {':exe "resize " . (winheight(0) * 3/4)<CR>', "decrease horizental window size"},
        ["<leader>v="] = {':exe "vertical resize " . (winwidth(0) * 5/4)<CR>', "increase vertical window size"},
        ["<leader>v-"] = {':exe "vertical resize " . (winwidth(0) * 3/4)<CR>', "decrease vertical window size"},
        ["<leader>cn"] = {':cnext<CR>', "next quickfix item"},
        ["<leader>cp"] = {':cprev<CR>', "previous quickfix item"},
        ["<leader>cc"] = {':cclose<CR>', "close quickfix windows"},
        ["<leader>ln"] = {':lnext<CR>', "next loclist item"},
        ["<leader>lp"] = {':lprev<CR>', "previous loclist item"},
        ["<leader>lc"] = {':lclose<CR>', "close loclist windows"},
    },
}

M.nvimtree = {
    plugin = true,
    n = {
        ["<F1>"] = {"<cmd> NvimTreeToggle <CR>", "toggle nvimtree"},
        ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
    },
}

M.undotree = {
    plugin = true,
    n = {
        ["<F2>"] = {":UndotreeToggle <CR>", "toggle undo tree"},
    },
}

M.symbols = {
    plugin = true,
    n = {
        ["<F3>"] = {"<cmd> SymbolsOutline <CR>", "toggle synbols outline"},
    },
}

M.telescope = {
    plugin = true,
    n = {
        -- find
        ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
        ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
        ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
        ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
        ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
        ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
        ["<leader>gr"] = { "<cmd> Telescope lsp_references <CR>", "find references" },
    }
}

M.lsp = {
    plugin = true,
    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {
        ["<leader>gD"] = {
            function()
                vim.lsp.buf.declaration()
            end,
            "lsp declaration",
        },

        ["<leader>gd"] = {
            function()
                vim.lsp.buf.definition()
            end,
            "lsp definition",
        },

        ["<leader>rn"] = {
            function()
                vim.lsp.buf.rename()
            end,
            "lsp rename",
        },

        ["<leader>K"] = {
            function()
                vim.lsp.buf.hover()
            end,
            "lsp hover",
        },

        ["<leader>gi"] = {
            function()
                vim.lsp.buf.implementation()
            end,
            "lsp implementation",
        },

        ["<leader>ls"] = {
            function()
                vim.lsp.buf.signature_help()
            end,
            "lsp signature_help",
        },

        ["<leader>D"] = {
            function()
                vim.lsp.buf.type_definition()
            end,
            "lsp definition type",
        },

        ["<leader>ca"] = {
            function()
                vim.lsp.buf.code_action()
            end,
            "lsp code_action",
        },

        ["<leader>la"] = {
            function()
                vim.lsp.codelens.run()
            end,
            "lsp codelens",
        },

        ["<leader>f"] = {
            function()
                vim.diagnostic.open_float()
            end,
            "floating diagnostic",
        },

        ["[d"] = {
            function()
                vim.diagnostic.goto_prev()
            end,
            "goto prev",
        },

        ["]d"] = {
            function()
                vim.diagnostic.goto_next()
            end,
            "goto_next",
        },

    },
}

M.copy = {
    plugin = true,
    n = {
        ["<leader>y"] = {
            function()
                return require('osc52').copy_operator()
            end,
            "copy the given text to the clipboard",
            opts = {
                expr = true,
            }
        },
        ["<leader>yy"] = {
            "<leader>y_",
            "copy the current line to the clipboard",
            opts = {
                remap = true,
            },
        },
    },
    x = {
        ["<leader>y"] = {
            function()
                require('osc52').copy_visual()
            end,
            "copy the current selection to the clipboard"
        },
    },
}

M.hop = {
    plugin = true,
    n = {
        ["<leader>hw"] = {
            ':HopWord <CR>',
            "HopWord",
        },
        ["<leader>hl"] = {
            ':HopLine <CR>',
            "HopLine",
        },
    },
}

return M
