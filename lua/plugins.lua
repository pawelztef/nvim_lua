--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function(use)
    use 'wbthomason/packer.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      -- tag = '0.1.3',
      requires = { {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-project.nvim',
      } }
    }
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    }
    use {
      'nvim-treesitter/nvim-treesitter',
      tag = 'v0.9.1',
      run = ':TSUpdate'
    }
    use 'shaunsingh/nord.nvim'
    use 'xero/sourcerer.vim'
    use {
      'maxmellon/vim-jsx-pretty',
      requires = { { 'yuezk/vim-js' } }
    }
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
      },
    }
    -- use 'jose-elias-alvarez/null-ls.nvim'
    use 'easymotion/vim-easymotion'
    use 'tpope/vim-commentary'
    use 'MattesGroeger/vim-bookmarks'
    -- use 'APZelos/blamer.nvim'
    use 'nvim-lualine/lualine.nvim'
    -- use 'kevinhwang91/rnvimr'
    use {
      'francoiscabrol/ranger.vim',
      requires = {
        'rbgrouleff/bclose.vim',
      }
    }
    use {
      'TimUntersberger/neogit',
      tag = 'v1.0.0',
      requires = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
      },
    }
    use 'mhinz/vim-startify'
    use 'machakann/vim-sandwich'
    use 'mg979/vim-visual-multi'
    use 'beauwilliams/focus.nvim'
    use {
      'lewis6991/gitsigns.nvim',
      tag = 'v0.8.1'
    }
    use 'anuvyklack/help-vsplit.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'lunarvim/Onedarker.nvim'
    use 'lewis6991/impatient.nvim'
    -- use 'fisadev/vim-isort'
    use 'brentyi/isort.vim'
    use 'joshdick/onedark.vim'
    use 'rebelot/kanagawa.nvim'
    use 'seblj/nvim-tabline'
    use 'mgedmin/python-imports.vim'
    use 'averms/black-nvim'
    use 'mattn/emmet-vim'
    use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    use 'akinsho/toggleterm.nvim'
    use 'tom-anders/telescope-vim-bookmarks.nvim'
    use 'ludovicchabant/vim-gutentags'
    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    use 'stevearc/aerial.nvim'
    -- use 'preservim/tagbar'
    use 'f-person/git-blame.nvim'
    use 'sam4llis/nvim-lua-gf'
    use({
      "jackMort/ChatGPT.nvim",
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim"
      }
    })
    use 'ray-x/cmp-treesitter'
    use 'farmergreg/vim-lastplace'
    use 'folke/zen-mode.nvim'
  end)
