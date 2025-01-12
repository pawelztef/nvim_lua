require("noice").setup({
  lsp = {
    progress = {
      enabled = false
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      ["vim.lsp.handlers.show_line_diagnostics"] = false,
      ["vim.lsp.handlers.show_diagnostics"] = false,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false,        -- use a classic bottom cmdline for search
    command_palette = false,      -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },
  popupmenu = {
    enabled = true,
    backend = "nui",
    kind_icons = false,
  },
  messages = {
    enabled = true,            -- enables the Noice messages UI
    view = false,
    view_error = "notify",     -- view for errors
    view_warn = "notify",      -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = false,
  },
  cmdline = {
    enabled = true,         -- enables the Noice cmdline UI
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = {},              -- global options for the cmdline. See section on views
    format = {
      -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
      -- view: (default is cmdline view)
      -- opts: any options passed to the view
      -- icon_hl_group: optional hl_group for the icon
      -- title: set to anything or empty string to hide
      cmdline = { pattern = "^:", icon = ":", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "help" },
      input = { view = "cmdline_input", icon = ":" }, -- Used by input()
      -- lua = false, -- to disable a format, set to `false`
    },
  }
})

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    local msg = string.format("Register:  %s", vim.fn.reg_recording())
    _MACRO_RECORDING_STATUS = true
    vim.notify(msg, vim.log.levels.INFO, {
      title = "Macro Recording",
      keep = function() return _MACRO_RECORDING_STATUS end,
    })
  end,
  group = vim.api.nvim_create_augroup("NoiceMacroNotfication", {clear = true})
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    _MACRO_RECORDING_STATUS = false
    vim.notify("Success!", vim.log.levels.INFO, {
      title = "Macro Recording End",
      timeout = 2000,
    })
  end,
  group = vim.api.nvim_create_augroup("NoiceMacroNotficationDismiss", {clear = true})
})
