local notify = require("notify")

local function xpadded_renderer(bufnr, notif, highlights, config)
  local lines = {}
  for _, line in ipairs(notif.message) do
    table.insert(lines, "  " .. line .. "  ")
  end
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  for i, _ in ipairs(lines) do
    vim.api.nvim_buf_add_highlight(bufnr, -1, highlights.body, i - 1, 0, -1)
  end
end

local base = require("notify.render.base")

local function padded_renderer(bufnr, notif, highlights, config)
  local namespace = base.namespace()
  local icon = notif.icon
  local title = notif.title[1]

  local prefix
  if type(title) == "string" and #title > 0 then
    prefix = string.format("%s |", title)
  else
    prefix = string.format("%s |", title)
  end
  notif.message[1] = string.format("%s %s", prefix, notif.message[1])

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, notif.message)

  local icon_length = vim.str_utfindex(icon)
  local prefix_length = vim.str_utfindex(prefix)

  local lines = {}
  for _, line in ipairs(notif.message) do
    table.insert(lines, "  " .. line .. "  ")
  end
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
    hl_group = highlights.icon,
    end_col = icon_length + 1,
    priority = 50,
  })
  vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, icon_length + 1, {
    hl_group = highlights.title,
    end_col = prefix_length + 1,
    priority = 50,
  })
  vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, prefix_length + 1, {
    hl_group = highlights.body,
    end_line = #notif.message,
    priority = 50,
  })
end

notify.setup({
  background_colour = "#000000",
  fps = 10,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "",
    WARN = ""
  },
  level = 2,
  minimum_width = 40,
  max_width = 60,
  render = padded_renderer,
  stages = "fade_in_slide_out",
  time_formats = {
    notification = "%T",
    notification_history = "%FT%T"
  },
  timeout = 5000,
  top_down = true
})
