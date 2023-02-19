local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
        print "Cloning packer .."
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local present, packer = pcall(require, "packer")

if not present then
    return
end

vim.cmd "packadd packer.nvim"

packer.startup(function(use)
    use { "lewis6991/impatient.nvim" }

    use {
        'nvim-lua/plenary.nvim',
        module = "plenary"
    }

    use { 'wbthomason/packer.nvim' }

    use { 'morhetz/gruvbox' }

    use {
        'kyazdani42/nvim-web-devicons',
        module = "nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup{}
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("plugins.configs.lualine")
        end,
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        opt = true,
        setup = function()
            require("core.lazy_load").on_file_open "indent-blankline.nvim"
        end,
        config = function()
            require("indent_blankline").setup {
                blankline_disable_with_nolist = false,
            }
        end
    }

    use {
        'neovim/nvim-lspconfig',
        opt = true,
        after = {"mason.nvim", "mason-lspconfig.nvim"},
        setup = function()
            require("core.lazy_load").on_file_open "nvim-lspconfig"
            require("core.utils").load_mappings "lsp"
        end,
        -- 在mason中执行，保证执行顺序
        config = function()
            require "plugins.configs.lspconfig"
        end
    }

    use {
        'rafamadriz/friendly-snippets',
        event = "InsertEnter",
        module = { "cmp", "cmp_nvim_lsp" },
    }

    use {'onsails/lspkind-nvim', after = "friendly-snippets"}

    use {
        'hrsh7th/nvim-cmp',
        after = "lspkind-nvim",
        config = function()
            require "plugins.configs.cmp"
        end
    }

    use {
        'L3MON4D3/LuaSnip',
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function()
            require("plugins.configs.luasnip")
        end
    }

    use {'saadparwaiz1/cmp_luasnip', after = "LuaSnip", }
    use {"hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }
    use {'hrsh7th/cmp-nvim-lsp', after = "cmp-nvim-lua"}
    use {'hrsh7th/cmp-buffer', after = "cmp-nvim-lsp"}
    use {'hrsh7th/cmp-path', after = "cmp-buffer"}
    use {'hrsh7th/cmp-cmdline', after = "cmp-path"}

    use {
        'buoto/gotests-vim',
        ft = 'go'
    }

    use {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        config = function()
            require "plugins.configs.telescope"
        end,
        setup = function()
            require("core.utils").load_mappings "telescope"
        end,
        wants = "telescope-fzf-native.nvim",
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim', 
        cmd = "Telescope",
        run = 'make' 
    }

    use {
        'simrat39/symbols-outline.nvim',
        cmd = "SymbolsOutline",
        config = function()
            require("symbols-outline").setup()
        end,
        setup = function()
            require("core.utils").load_mappings "symbols"
        end
    }

    use {
        'mbbill/undotree',
        cmd = {"UndotreeToggle", "UndotreeFocus"},
        setup = function()
            require("core.utils").load_mappings "undotree"
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        module = "nvim-treesitter",
        setup = function()
            require("core.lazy_load").on_file_open "nvim-treesitter"
        end,
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
        run = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    }

    -- File explore
    use {
        'kyazdani42/nvim-tree.lua',
        ft = "alpha",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require "plugins.configs.nvimtree"
        end,
        setup = function()
            require("core.utils").load_mappings "nvimtree"
        end
    }

    -- mason相关配置文件在lspconfig
    use {
        "williamboman/mason.nvim",
        module = "mason"
    }

    use {
        "williamboman/mason-lspconfig.nvim",
        module = "mason-lspconfig",
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end

    -- golang
    use {
        "olexsmir/gopher.nvim",
        ft = "go",
        requires = { -- dependencies
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function ()
            require("gopher").setup({})
        end,
        run = ":GoInstallDeps",
    }
end)
