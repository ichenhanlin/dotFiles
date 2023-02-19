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
    },
}

M.nvimtree = {
    plugin = true,
    n = {
        ["<F4>"] = {"<cmd> NvimTreeToggle <CR>", "toggle nvimtree"},
        ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
    },
}

M.undotree = {
    plugin = true,
    n = {
        ["<F5>"] = {":UndotreeToggle <CR>", "toggle undo tree"},
    },
}

M.symbols = {
    plugin = true,
    n = {
        ["<F6>"] = {"<cmd> SymbolsOutline <CR>", "toggle synbols outline"},
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
        ["<leader>fr"] = { "<cmd> Telescope lsp_references <CR>", "find references" },
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

    ["<leader>cl"] = {
      function()
        vim.lsp.codelens.run()
      end,
      "lsp codelens",
    },

    ["<leader>gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },

    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },

    ["<leader>ep"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },

    ["<leader>en"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },

  },
}
return M