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
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope.nvim',
    "nvim-telescope/telescope-frecency.nvim",
    'tom-anders/telescope-vim-bookmarks.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    {
      'nvim-treesitter/nvim-treesitter',
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
      "neovim/nvim-lspconfig",
    },
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
    "lukas-reineke/lsp-format.nvim",
    {
      "pmizio/typescript-tools.nvim",
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
    },
    'sindrets/diffview.nvim',
    'mhinz/vim-startify',
    'machakann/vim-sandwich',
    'mg979/vim-visual-multi',
    'beauwilliams/focus.nvim',
    {
      'lewis6991/gitsigns.nvim',
      version = 'v0.8.1'
    },
    'anuvyklack/help-vsplit.nvim',
    'lewis6991/impatient.nvim',
    'brentyi/isort.vim',
    'seblj/nvim-tabline',
    'mgedmin/python-imports.vim',
    'averms/black-nvim',
    'mattn/emmet-vim',
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    'akinsho/toggleterm.nvim',
    'ludovicchabant/vim-gutentags',
    "nvimtools/none-ls.nvim",
    "nvim-lua/plenary.nvim",
    'stevearc/aerial.nvim',
    'f-person/git-blame.nvim',
    'sam4llis/nvim-lua-gf',
    'stevearc/conform.nvim',
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    {
      "jackMort/ChatGPT.nvim",
    },
    {
      'ray-x/cmp-treesitter',
      lazy = false,
    },
    'farmergreg/vim-lastplace',
    "williamboman/mason.nvim",
    'nvim-treesitter/playground',
    'rcarriga/nvim-notify',
    {
      "folke/noice.nvim",
      tag = "v4.9.0",
      event = "VeryLazy",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      }
    },
      {
      "esmuellert/codediff.nvim",
      lazy = false,
    },
    {
      -- "Sarctiann/cursor-agent.nvim",
      "pawelztef/cursor-agent.nvim",
      branch = "dev",
      dependencies = {
        "folke/snacks.nvim",
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      config = function()
        require('render-markdown').setup({
          completions = { lsp = { enabled = true } },
          heading = {
            -- Useful context to have when evaluating values.
            -- | level    | the number of '#' in the heading marker         |
            -- | sections | for each level how deeply nested the heading is |

            -- Turn on / off heading icon & background rendering.
            enabled = true,
            -- Additional modes to render headings.
            render_modes = false,
            -- Turn on / off atx heading rendering.
            atx = true,
            -- Turn on / off setext heading rendering.
            setext = true,
            -- Turn on / off sign column related rendering.
            sign = false,
            -- Replaces '#+' of 'atx_h._marker'.
            -- Output is evaluated depending on the type.
            -- | function | `value(context)`              |
            -- | string[] | `cycle(value, context.level)` |
            icons = { '█▌▌▎▏ ', '█▌▌▎  ', '█▌▌   ',  '█▌    ', '▌▏   ', '▏▏   ',},
            -- Determines how icons fill the available space.
            -- | eol     | '#'s are concealed and icon is placed at right most column   |
            -- | right   | '#'s are concealed and icon is appended to right side        |
            -- | inline  | '#'s are concealed and icon is inlined on left side          |
            -- | overlay | icon is left padded with spaces and overlayed hiding all '#' |
            position = 'overlay',
            -- Added to the sign column if enabled.
            -- Output is evaluated by `cycle(value, context.level)`.
            signs = { '󰫎 ' },
            -- Width of the heading background.
            -- | block | width of the heading text |
            -- | full  | full width of the window  |
            -- Can also be a list of the above values evaluated by `clamp(value, context.level)`.
            width = 'full',
            -- Amount of margin to add to the left of headings.
            -- Margin available space is computed after accounting for padding.
            -- If a float < 1 is provided it is treated as a percentage of available window space.
            -- Can also be a list of numbers evaluated by `clamp(value, context.level)`.
            left_margin = 1,
            -- Amount of padding to add to the left of headings.
            -- Output is evaluated using the same logic as 'left_margin'.
            left_pad = 0,
            -- Amount of padding to add to the right of headings when width is 'block'.
            -- Output is evaluated using the same logic as 'left_margin'.
            right_pad = 0,
            -- Minimum width to use for headings when width is 'block'.
            -- Can also be a list of integers evaluated by `clamp(value, context.level)`.
            min_width = 0,
            -- Determines if a border is added above and below headings.
            -- Can also be a list of booleans evaluated by `clamp(value, context.level)`.
            border = false,
            border_virtual = false,
            border_prefix = false,
            above = '',
            below = '',
            -- Highlight for the heading icon and extends through the entire line.
            -- Output is evaluated by `clamp(value, context.level)`.
            backgrounds = {
              'RenderMarkdownH1Bg',
              'RenderMarkdownH2Bg',
              'RenderMarkdownH3Bg',
              'RenderMarkdownH4Bg',
              'RenderMarkdownH5Bg',
              'RenderMarkdownH6Bg',
            },
            -- Highlight for the heading and sign icons.
            -- Output is evaluated using the same logic as 'backgrounds'.
            foregrounds = {
              'RenderMarkdownH1',
              'RenderMarkdownH2',
              'RenderMarkdownH3',
              'RenderMarkdownH4',
              'RenderMarkdownH5',
              'RenderMarkdownH6',
            },
            -- Define custom heading patterns which allow you to override various properties based on
            -- the contents of a heading.
            -- The key is for healthcheck and to allow users to change its values, value type below.
            -- | pattern    | matched against the heading text @see :h lua-patterns |
            -- | icon       | optional override for the icon                        |
            -- | background | optional override for the background                  |
            -- | foreground | optional override for the foreground                  |
            custom = {},
          },
          bullet = {
            -- Useful context to have when evaluating values.
            -- | level | how deeply nested the list is, 1-indexed          |
            -- | index | how far down the item is at that level, 1-indexed |
            -- | value | text value of the marker node                     |

            -- Turn on / off list bullet rendering
            enabled = true,
            -- Additional modes to render list bullets
            render_modes = false,
            -- Replaces '-'|'+'|'*' of 'list_item'.
            -- If the item is a 'checkbox' a conceal is used to hide the bullet instead.
            -- Output is evaluated depending on the type.
            -- | function   | `value(context)`                                    |
            -- | string     | `value`                                             |
            -- | string[]   | `cycle(value, context.level)`                       |
            -- | string[][] | `clamp(cycle(value, context.level), context.index)` |
            icons = { '▪', '▫', '◆', '◇' },
            -- Replaces 'n.'|'n)' of 'list_item'.
            -- Output is evaluated using the same logic as 'icons'.
            ordered_icons = function(ctx)
              local value = vim.trim(ctx.value)
              local index = tonumber(value:sub(1, #value - 1))
              return ('%d.'):format(index > 1 and index or ctx.index)
            end,
            -- Padding to add to the left of bullet point.
            -- Output is evaluated depending on the type.
            -- | function | `value(context)` |
            -- | integer  | `value`          |
            left_pad = 2,
            -- Padding to add to the right of bullet point.
            -- Output is evaluated using the same logic as 'left_pad'.
            right_pad = 0,
            -- Highlight for the bullet icon.
            -- Output is evaluated using the same logic as 'icons'.
            highlight = 'RenderMarkdownBullet',
            -- Highlight for item associated with the bullet point.
            -- Output is evaluated using the same logic as 'icons'.
            scope_highlight = {},
            -- Priority to assign to scope highlight.
            scope_priority = nil,
          },
          paragraph = {
            -- Useful context to have when evaluating values.
            -- | text | text value of the node |

            -- Turn on / off paragraph rendering.
            enabled = true,
            -- Additional modes to render paragraphs.
            render_modes = false,
            -- Amount of margin to add to the left of paragraphs.
            -- If a float < 1 is provided it is treated as a percentage of available window space.
            -- Output is evaluated depending on the type.
            -- | function | `value(context)` |
            -- | number   | `value`          |
            left_margin = 2,
            -- Amount of padding to add to the first line of each paragraph.
            -- Output is evaluated using the same logic as 'left_margin'.
            indent = 0,
            -- Minimum width to use for paragraphs.
            min_width = 0,
          },
          link = {
            -- Turn on / off inline link icon rendering.
            enabled = true,
            -- Additional modes to render links.
            render_modes = false,
            -- How to handle footnote links, start with a '^'.
            footnote = {
              -- Turn on / off footnote rendering.
              enabled = true,
              -- Inlined with content.
              icon = '󰯔 ',
              -- Custom processing for footnote body to show.
              -- Runs before prefix / suffix are added and superscript processing.
              body = function(ctx)
                return ctx.text
              end,
              -- Replace value with superscript equivalent.
              superscript = true,
              -- Added before link content.
              prefix = '',
              -- Added after link content.
              suffix = '',
            },
            -- Inlined with 'image' elements.
            image = '󰥶 ',
            -- Check custom for 'image' elements.
            image_custom = true,
            email = '󰌹 ',
            -- Fallback icon for 'inline_link' and 'uri_autolink' elements.
            hyperlink = '󰌹 ',
            -- Applies to the inlined icon as a fallback.
            highlight = 'RenderMarkdownLink',
            -- Applies to the link title.
            highlight_title = 'RenderMarkdownLinkTitle',
            -- Applies to WikiLink elements.
            wiki = {
              -- Turn on / off WikiLink rendering.
              enabled = true,
              -- Inlined with content.
              icon = '󱗖 ',
              -- Custom processing for WikiLink body to show.
              body = function()
                return nil
              end,
              -- Applies to the inlined icon.
              highlight = 'RenderMarkdownWikiLink',
              -- Highlight for item associated with the WikiLink.
              scope_highlight = nil,
            },
            -- Define custom destination patterns so icons can quickly inform you of what a link
            -- contains. Applies to 'image', 'inline_link', 'uri_autolink', and WikiLink nodes.
            -- When multiple patterns match a link the one with the longer pattern is used.
            -- The key is for healthcheck and to allow users to change its values, value type below.
            -- | pattern   | matched against the destination text                            |
            -- | icon      | gets inlined before the link text                               |
            -- | kind      | optional determines how pattern is checked                      |
            -- |           | pattern | @see :h lua-patterns, is the default if not set       |
            -- |           | suffix  | @see :h vim.endswith()                                |
            -- | priority  | optional used when multiple match, uses pattern length if empty |
            -- | highlight | optional highlight for 'icon', uses fallback highlight if empty |
            -- custom = {
            --   web = { pattern = '^http', icon = '󰖟 ' },
            --   apple = { pattern = 'apple%.com', icon = ' ' },
            --   discord = { pattern = 'discord%.com', icon = '󰙯 ' },
            --   github = { pattern = 'github%.com', icon = '󰊤 ' },
            --   gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
            --   google = { pattern = 'google%.com', icon = '󰊭 ' },
            --   hackernews = { pattern = 'ycombinator%.com', icon = ' ' },
            --   linkedin = { pattern = 'linkedin%.com', icon = '󰌻 ' },
            --   microsoft = { pattern = 'microsoft%.com', icon = ' ' },
            --   neovim = { pattern = 'neovim%.io', icon = ' ' },
            --   reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
            --   slack = { pattern = 'slack%.com', icon = '󰒱 ' },
            --   stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
            --   steam = { pattern = 'steampowered%.com', icon = ' ' },
            --   twitter = { pattern = 'twitter%.com', icon = ' ' },
            --   wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
            --   x = { pattern = 'x%.com', icon = ' ' },
            --   youtube = { pattern = 'youtube[^.]*%.com', icon = '󰗃 ' },
            --   youtube_short = { pattern = 'youtu%.be', icon = '󰗃 ' },
            -- },
          },
          code = {
            enabled = true,
            render_modes = false,
            sign = false,
            conceal_delimiters = true,
            language = true,
            position = 'left',
            language_icon = true,
            language_name = true,
            language_info = true,
            language_pad = 1,
            disable = {},
            width = 'full',
            left_margin = 0,
            left_pad = 2,
            right_pad = 0,
            min_width = 0,
            border = 'hide',
            language_border = '█',
            language_left = '',
            language_right = '',
            above = '▄',
            below = '▀',
            priority = 140,
            highlight = 'RenderMarkdownCode',
            highlight_info = 'RenderMarkdownCodeInfo',
            highlight_language = nil,
            highlight_border = 'RenderMarkdownCodeBorder',
            highlight_fallback = 'RenderMarkdownCodeFallback',
            highlight_inline = 'RenderMarkdownCodeInline',
            highlight_inline_left = nil,
            highlight_inline_right = nil,
            style = 'language',
          },
        })
      end,
    },
  },
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
