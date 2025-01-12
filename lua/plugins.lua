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
    'nvim-treesitter/playground',
    -- {
    --   "yetone/avante.nvim",
    --   event = "VeryLazy",
    --   lazy = false,
    --   version = false, -- set this if you want to always pull the latest change
    --   opts = {
    --     provider = "openai",
    --     openai = {
    --       endpoint = "https://api.openai.com/v1",
    --       model = "gpt-4o", -- The model name to use with this provider
    --       api_key_name = "OPENAI_API_KEY",

    --     },
    --   },
    --   build = "make",
    --   dependencies = {
    --     "nvim-treesitter/nvim-treesitter",
    --     "stevearc/dressing.nvim",
    --     "nvim-lua/plenary.nvim",
    --     "MunifTanjim/nui.nvim",
    --   },
    -- }
    {
      "robitx/gp.nvim",
      config = function()
        local conf = {
          providers = {
            openai = {
              disable = false,
              endpoint = "https://api.openai.com/v1/chat/completions",
              secret = os.getenv("OPENAI_API_KEY"),
            },
          },
          cmd_prefix = "Gp",
          curl_params = {},
          -- default agent names set during startup, if nil last used agent is used
          default_command_agent = nil,
          default_chat_agent = nil,
          agents = {
            {
              name = "ExampleDisabledAgent",
              disable = true,
            },
            {
              name = "ChatGPT4o",
              chat = true,
              command = false,
              -- string with model name or table with model name and parameters
              model = { model = "gpt-4o", temperature = 0, top_p = 1 },
              -- system prompt (use this to specify the persona/role of the AI)
              system_prompt = require("gp.defaults").chat_system_prompt,
            },
            {
              provider = "openai",
              name = "ChatGPT4o-mini",
              chat = true,
              command = false,
              -- string with model name or table with model name and parameters
              model = { model = "gpt-4o-mini", temperature = 1.1, top_p = 1 },
              -- system prompt (use this to specify the persona/role of the AI)
              system_prompt = require("gp.defaults").chat_system_prompt,
            },
          },

          -- directory for storing chat files
          chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/chats",
          -- chat user prompt prefix
          chat_user_prefix = "💬:",
          -- chat assistant prompt prefix (static string or a table {static, template})
          -- first string has to be static, second string can contain template {{agent}}
          -- just a static string is legacy and the [{{agent}}] element is added automatically
          -- if you really want just a static string, make it a table with one element { "🤖:" }
          chat_assistant_prefix = { "🤖:", "[{{agent}}]" },
          -- The banner shown at the top of each chat file.
          chat_template = require("gp.defaults").chat_template,
          -- if you want more real estate in your chat files and don't need the helper text
          -- chat_template = require("gp.defaults").short_chat_template,
          -- chat topic generation prompt
          chat_topic_gen_prompt = "Summarize the topic of our conversation above"
              .. " in two or three words. Respond only with those words.",
          -- chat topic model (string with model name or table with model name and parameters)
          -- explicitly confirm deletion of a chat file
          chat_confirm_delete = true,
          -- conceal model parameters in chat
          chat_conceal_model_params = true,
          -- local shortcuts bound to the chat buffer
          -- (be careful to choose something which will work across specified modes)
          chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },
          chat_shortcut_delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>d" },
          chat_shortcut_stop = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>s" },
          chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>c" },
          -- default search term when using :GpChatFinder
          chat_finder_pattern = "topic ",
          chat_finder_mappings = {
            delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-d>" },
          },
          -- if true, finished ChatResponder won't move the cursor to the end of the buffer
          chat_free_cursor = false,
          -- use prompt buftype for chats (:h prompt-buffer)
          chat_prompt_buf_type = false,

          -- how to display GpChatToggle or GpContext
          ---@type "popup" | "split" | "vsplit" | "tabnew"
          toggle_target = "popup",

          -- styling for chatfinder
          ---@type "single" | "double" | "rounded" | "solid" | "shadow" | "none"
          style_chat_finder_border = "single",
          -- margins are number of characters or lines
          style_chat_finder_margin_bottom = 8,
          style_chat_finder_margin_left = 1,
          style_chat_finder_margin_right = 2,
          style_chat_finder_margin_top = 2,
          -- how wide should the preview be, number between 0.0 and 1.0
          style_chat_finder_preview_ratio = 0.5,

          -- styling for popup
          ---@type "single" | "double" | "rounded" | "solid" | "shadow" | "none"
          style_popup_border = "single",
          -- margins are number of characters or lines
          style_popup_margin_bottom = 8,
          style_popup_margin_left = 1,
          style_popup_margin_right = 2,
          style_popup_margin_top = 2,
          style_popup_max_width = 160,

          -- in case of visibility colisions with other plugins, you can increase/decrease zindex
          zindex = 49,

          -- command config and templates below are used by commands like GpRewrite, GpEnew, etc.
          -- command prompt prefix for asking user for input (supports {{agent}} template variable)
          command_prompt_prefix_template = "🤖 {{agent}} ~ ",
          -- auto select command response (easier chaining of commands)
          -- if false it also frees up the buffer cursor for further editing elsewhere
          command_auto_select_response = true,

          -- templates
          template_selection = "I have the following from {{filename}}:"
              .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}",
          template_rewrite = "I have the following from {{filename}}:"
              .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
              .. "\n\nRespond exclusively with the snippet that should replace the selection above.",
          template_append = "I have the following from {{filename}}:"
              .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
              .. "\n\nRespond exclusively with the snippet that should be appended after the selection above.",
          template_prepend = "I have the following from {{filename}}:"
              .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
              .. "\n\nRespond exclusively with the snippet that should be prepended before the selection above.",
          template_command = "{{command}}",

          -- https://platform.openai.com/docs/guides/speech-to-text/quickstart
          -- Whisper costs $0.006 / minute (rounded to the nearest second)
          -- by eliminating silence and speeding up the tempo of the recording
          -- we can reduce the cost by 50% or more and get the results faster

          -- example hook functions (see Extend functionality section in the README)
          hooks = {
            -- GpInspectPlugin provides a detailed inspection of the plugin state
            InspectPlugin = function(plugin, params)
              local bufnr = vim.api.nvim_create_buf(false, true)
              local copy = vim.deepcopy(plugin)
              local key = copy.config.openai_api_key or ""
              copy.config.openai_api_key = key:sub(1, 3) .. string.rep("*", #key - 6) .. key:sub(-3)
              local plugin_info = string.format("Plugin structure:\n%s", vim.inspect(copy))
              local params_info = string.format("Command params:\n%s", vim.inspect(params))
              local lines = vim.split(plugin_info .. "\n" .. params_info, "\n")
              vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
              vim.api.nvim_win_set_buf(0, bufnr)
            end,

            -- GpInspectLog for checking the log file
            InspectLog = function(plugin, params)
              local log_file = plugin.config.log_file
              local buffer = plugin.helpers.get_buffer(log_file)
              if not buffer then
                vim.cmd("e " .. log_file)
              else
                vim.cmd("buffer " .. buffer)
              end
            end,

            -- GpImplement rewrites the provided selection/range based on comments in it
            Implement = function(gp, params)
              local template = "Having following from {{filename}}:\n\n"
                  .. "```{{filetype}}\n{{selection}}\n```\n\n"
                  .. "Please rewrite this according to the contained instructions."
                  .. "\n\nRespond exclusively with the snippet that should replace the selection above."

              local agent = gp.get_command_agent()
              gp.logger.info("Implementing selection with agent: " .. agent.name)

              gp.Prompt(
                params,
                gp.Target.rewrite,
                agent,
                template,
                nil, -- command will run directly without any prompting for user input
                nil -- no predefined instructions (e.g. speech-to-text from Whisper)
              )
            end,

            -- your own functions can go here, see README for more examples like
            -- :GpExplain, :GpUnitTests.., :GpTranslator etc.

            -- -- example of making :%GpChatNew a dedicated command which
            -- -- opens new chat with the entire current buffer as a context
            -- BufferChatNew = function(gp, _)
            -- 	-- call GpChatNew command in range mode on whole buffer
            -- 	vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
            -- end,

            -- -- example of adding command which opens new chat dedicated for translation
            -- Translator = function(gp, params)
            -- 	local chat_system_prompt = "You are a Translator, please translate between English and Chinese."
            -- 	gp.cmd.ChatNew(params, chat_system_prompt)
            --
            -- 	-- -- you can also create a chat with a specific fixed agent like this:
            -- 	-- local agent = gp.get_chat_agent("ChatGPT4o")
            -- 	-- gp.cmd.ChatNew(params, chat_system_prompt, agent)
            -- end,

            -- -- example of adding command which writes unit tests for the selected code
            -- UnitTests = function(gp, params)
            -- 	local template = "I have the following code from {{filename}}:\n\n"
            -- 		.. "```{{filetype}}\n{{selection}}\n```\n\n"
            -- 		.. "Please respond by writing table driven unit tests for the code above."
            -- 	local agent = gp.get_command_agent()
            -- 	gp.Prompt(params, gp.Target.enew, agent, template)
            -- end,

            -- -- example of adding command which explains the selected code
            -- Explain = function(gp, params)
            -- 	local template = "I have the following code from {{filename}}:\n\n"
            -- 		.. "```{{filetype}}\n{{selection}}\n```\n\n"
            -- 		.. "Please respond by explaining the code above."
            -- 	local agent = gp.get_chat_agent()
            -- 	gp.Prompt(params, gp.Target.popup, agent, template)
            -- end,
          }, -- For customization, refer to Install > Configuration in the Documentation/Readme
        }

        require("gp").setup(conf)

        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
      end,
    },
    "joshuavial/aider.nvim",
    -- lazy.nvim
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      }
    }
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
