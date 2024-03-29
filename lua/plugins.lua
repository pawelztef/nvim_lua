--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
    function(use)
        use 'wbthomason/packer.nvim'
        use {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.0',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }
        use {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make'
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use 'shaunsingh/nord.nvim'
        use 'rmehri01/onenord.nvim'
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
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        }
        -- use 'jose-elias-alvarez/null-ls.nvim'
        use 'Pocco81/auto-save.nvim'
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
            requires = {
                'nvim-lua/plenary.nvim',
                'sindrets/diffview.nvim',
            },
        }
        use 'preservim/tagbar'
        use 'mhinz/vim-startify'
        use 'machakann/vim-sandwich'
        use 'mg979/vim-visual-multi'
        use 'beauwilliams/focus.nvim'
        use 'lewis6991/gitsigns.nvim'
        use 'anuvyklack/help-vsplit.nvim'
        use 'EdenEast/nightfox.nvim'
        use 'lunarvim/Onedarker.nvim'
        use 'folke/which-key.nvim'
        use 'ahmedkhalf/project.nvim'
        use 'lewis6991/impatient.nvim'
        use 'fisadev/vim-isort'
        use 'joshdick/onedark.vim'
        use 'rebelot/kanagawa.nvim'
        use 'seblj/nvim-tabline'
        use 'mgedmin/python-imports.vim'
        use 'psf/black'
    end)
