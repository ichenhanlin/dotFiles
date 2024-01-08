require("lazy").setup({
    "lewis6991/impatient.nvim",
    'nvim-lua/plenary.nvim',

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                invert_selection = true,
                transparent_mode = true,
                overrides = {
                    TelescopeSelection = {link = "Visual"},
                    TelescopeSelectionCaret = { link = 'TelescopeSelection', default = true },
                }
            })
        end
    },

    {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require("nvim-web-devicons").setup{}
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("plugins.configs.lualine")
        end,
        dependencies = {
            "f-person/git-blame.nvim",
        },
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {
                blankline_disable_with_nolist = false,
            }
        end
    },

    {
        'neovim/nvim-lspconfig',
        init = function()
            require("core.utils").load_mappings "lsp"
        end,
        config = function()
            require "plugins.configs.lspconfig"
        end,
    },


    {
        'hrsh7th/nvim-cmp',
        config = function()
            require "plugins.configs.cmp"
        end,
        dependencies = {
            'windwp/nvim-autopairs',
            'saadparwaiz1/cmp_luasnip',
            "hrsh7th/cmp-nvim-lua",
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'onsails/lspkind-nvim',
            'L3MON4D3/LuaSnip',
        }
    },

    {
        'L3MON4D3/LuaSnip',
        config = function()
            local luasnip = require 'luasnip'
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        build = "make install_jsregexp",
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require "plugins.configs.telescope"
        end,
        init = function()
            require("core.utils").load_mappings "telescope"
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
        },
    },

    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("symbols-outline").setup()
        end,
        init = function()
            require("core.utils").load_mappings "symbols"
        end
    },

    {
        'mbbill/undotree',
        init = function()
            require("core.utils").load_mappings "undotree"
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    },

    {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require "plugins.configs.nvimtree"
        end,
        init = function()
            require("core.utils").load_mappings "nvimtree"
        end
    },


    {
        'ojroques/nvim-osc52',
        init = function()
            require("core.utils").load_mappings "copy"
        end,
        config = function()
            require('osc52').setup {
                silent = true,  -- Disable message on successful copy
            }
        end
    },

    {
        'mhartington/formatter.nvim',
        config = function()
            require "plugins.configs.formatter"
        end
    },

    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
    },

    {
        "ray-x/go.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require "plugins.configs.go"
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },

    {
        'code-biscuits/nvim-biscuits',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        event = "VeryLazy",
        config = function()
            require('nvim-biscuits').setup({
                cursor_line_only = true,
            })
        end,
    },

    {
        "xiyaowong/virtcolumn.nvim",
        event = "VeryLazy",
    },

    {
        'stevearc/dressing.nvim',
        config = function()
            require('dressing').setup()
        end
    },

    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end,
        init = function()
            require("core.utils").load_mappings "hop"
        end,
    },

})
