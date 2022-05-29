local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'joshdick/onedark.vim'
    use 'morhetz/gruvbox'

    -- Plug 'sheerun/vim-polyglot'

    -- Status Bar
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- indent Line
    use 'lukas-reineke/indent-blankline.nvim'

    -- LSP Support
    use {
        'williamboman/nvim-lsp-installer',
        'neovim/nvim-lspconfig'
    }

    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind-nvim'

    -- For luasnip users.
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'


    -- For Golang
    use {
        'fatih/vim-go', 
        run = ':GoUpdateBinaries', 
        ft = {'go'} 
    }
    use {
        'buoto/gotests-vim', 
        ft = {'go'}
    }
     
    -- For java
    -- use 'mfussenegger/nvim-jdtls'

    -- Telescope.nvim
    use 'nvim-lua/plenary.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope.nvim'

    -- symbol-outline
    use 'simrat39/symbols-outline.nvim'

    use 'mbbill/undotree'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
