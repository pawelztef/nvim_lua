local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

return require('lazy').setup({
  spec = {
    {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-project.nvim',
      }
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    {
      'nvim-treesitter/nvim-treesitter',
      version = 'v0.9.1',
      build = ':TSUpdate'
    },
    'shaunsingh/nord.nvim',
    'xero/sourcerer.vim',
    {
      'maxmellon/vim-jsx-pretty',
      dependencies = { { 'yuezk/vim-js' } }
    },
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
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
    },
    'easymotion/vim-easymotion',
    'tpope/vim-commentary',
    'MattesGroeger/vim-bookmarks',
    'nvim-lualine/lualine.nvim',
    {
      'francoiscabrol/ranger.vim',
      dependencies = {
        'rbgrouleff/bclose.vim',
      }
    },
    {
      'TimUntersberger/neogit',
      version = 'v1.0.0',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
      },
    },
    'mhinz/vim-startify',
    'machakann/vim-sandwich',
    'mg979/vim-visual-multi',
    'beauwilliams/focus.nvim',
    {
      'lewis6991/gitsigns.nvim',
      version = 'v0.8.1'
    },
    'anuvyklack/help-vsplit.nvim',
    'EdenEast/nightfox.nvim',
    'lunarvim/Onedarker.nvim',
    'lewis6991/impatient.nvim',
    'brentyi/isort.vim',
    'joshdick/onedark.vim',
    'rebelot/kanagawa.nvim',
    'seblj/nvim-tabline',
    'mgedmin/python-imports.vim',
    'averms/black-nvim',
    'mattn/emmet-vim',
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    'akinsho/toggleterm.nvim',
    'tom-anders/telescope-vim-bookmarks.nvim',
    'ludovicchabant/vim-gutentags',
    {
      "jose-elias-alvarez/null-ls.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    'stevearc/aerial.nvim',
    'f-person/git-blame.nvim',
    'sam4llis/nvim-lua-gf',
    {
      "jackMort/ChatGPT.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim"
      }
    },
    'ray-x/cmp-treesitter',
    'farmergreg/vim-lastplace',
    'folke/zen-mode.nvim',
    {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  install = { colorscheme = { "nord" } },
  ui = {
    size = { width = 0.6, height = 0.6 },
    wrap = true,
    border = "single",
    -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
    backdrop = 60,
    title = nil,
    title_pos = "center",
    pills = true,
    icons = {
      cmd = "  ",
      config = " ",
      event = "  ",
      favorite = "  ",
      ft = "  ",
      init = "  ",
      import = "  ",
      keys = "  ",
      lazy = "  ",
      loaded = " ",
      not_loaded = " ",
      plugin = "  ",
      runtime = "  ",
      require = "  ",
      source = " ",
      start = " ",
      task = " ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },
})
