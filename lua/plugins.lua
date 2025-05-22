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
      "nvim-telescope/telescope-frecency.nvim",
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    "lpoto/telescope-docker.nvim",
    {
      'nvim-treesitter/nvim-treesitter',
      -- version = 'v0.9.1',
      branch = 'master',
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
    "lukas-reineke/lsp-format.nvim",
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    },
    'easymotion/vim-easymotion',
    'tpope/vim-commentary',
    'MattesGroeger/vim-bookmarks',
    {
      'nvim-lualine/lualine.nvim',
      lazy = false,
    },
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
    "nvimtools/none-ls.nvim",
    "nvim-lua/plenary.nvim",
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
    {
      'ray-x/cmp-treesitter',
      lazy = false,
    },
    'farmergreg/vim-lastplace',
    'folke/zen-mode.nvim',
    {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    'nvim-treesitter/playground',
    {
      "robitx/gp.nvim",
    },
    'rcarriga/nvim-notify',
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      }
    },
    {
      "kiyoon/python-import.nvim",
      build = "pipx install . --force",
      keys = {
        -- {
        --   "<space>in",
        --   function()
        --     require("python_import.api").add_import_current_word_and_notify()
        --     vim.cmd("Isort")
        --   end,
        --   mode = { "i", "n" },
        --   silent = true,
        --   desc = "Add python import",
        --   ft = "python",
        -- },
        {
          "<space>I",
          function()
            require("python_import.api").add_import_current_selection_and_notify()
            vim.cmd("Isort")
          end,
          mode = { "i", "n" },
          silent = true,
          desc = "Add python import",
          ft = "python",
        },
        {
          "<space>IN",
          function()
            require("python_import.api").add_import_current_word_and_move_cursor()
            vim.cmd("Isort")
          end,
          mode = "n",
          silent = true,
          desc = "Add python import and move cursor",
          ft = "python",
        },
        -- {
        --   "<space>i",
        --   function()
        --     require("python_import.api").add_import_current_selection_and_move_cursor()
        --   end,
        --   mode = "x",
        --   silent = true,
        --   desc = "Add python import and move cursor",
        --   ft = "python",
        -- },
        -- {
        --   "<space>tr",
        --   function()
        --     require("python_import.api").add_rich_traceback()
        --   end,
        --   silent = true,
        --   desc = "Add rich traceback",
        --   ft = "python",
        -- },
      },
      opts = {
        -- Example 1:
        -- Default behaviour for `tqdm` is `from tqdm.auto import tqdm`.
        -- If you want to change it to `import tqdm`, you can set `import = {"tqdm"}` and `import_from = {tqdm = nil}` here.
        -- If you want to change it to `from tqdm import tqdm`, you can set `import_from = {tqdm = "tqdm"}` here.

        -- Example 2:
        -- Default behaviour for `logger` is `import logging`, ``, `logger = logging.getLogger(__name__)`.
        -- If you want to change it to `import my_custom_logger`, ``, `logger = my_custom_logger.get_logger()`,
        -- you can set `statement_after_imports = {logger = {"import my_custom_logger", "", "logger = my_custom_logger.get_logger()"}}` here.
        extend_lookup_table = {
          import = {
            -- "tqdm",
          },

          import_as = {
            -- These are the default values. Here for demonstration.
            -- np = "numpy",
            -- pd = "pandas",
          },

          import_from = {
            -- tqdm = nil,
            -- tqdm = "tqdm",
          },

          statement_after_imports = {
            -- logger = { "import my_custom_logger", "", "logger = my_custom_logger.get_logger()" },
          },
        },

        ---Return nil to indicate no match is found and continue with the default lookup
        ---Return a table to stop the lookup and use the returned table as the result
        ---Return an empty table to stop the lookup. This is useful when you want to add to wherever you need to.
        custom_function = function(winnr, word, ts_node)
          -- if vim.endswith(word, "_DIR") then
          --   return { "from my_module import " .. word }
          -- end
        end,
      },
    },
    "rcarriga/nvim-notify",
    'stevearc/conform.nvim',
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
