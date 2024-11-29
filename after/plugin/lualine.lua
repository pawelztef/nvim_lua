vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
vim.g.gitblame_date_format = '%d/%m/%y'
vim.g.gitblame_message_template = '<author> • <date> • <summary>'
local git_blame = require('gitblame')

local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then
      return ''
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
      return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
    end
    return str
  end
end

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'iceberg',
    component_separators = { left = '', right = ' ' },
    -- section_separators = { left = '▊▋▌▍▎', right = '▎▍▌▋▊' },
    section_separators = { left = '▊▋▌▍▎', right = '▎▍▌▋▊' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    symbols = {
      modified = '',           -- Text to show when the file is modified.
      readonly = '[readonly]', -- Text to show when the file is non-modifiable or readonly.
      unnamed = '[no name]',   -- Text to show for unnamed buffers.
      newfile = '[new]',       -- Text to show for newly created file before first write
      added = '+',
      removed = '-',
    },
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'filename', path = 0 } },
    lualine_c = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available, fmt = trunc(150, 18, 90, false) } },
    lualine_x = { 'diff', 'diagnostics' },
    lualine_y = { 'branch' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 0 } },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  -- tabline = {
  --     lualine_a = {'filename'},
  --     lualine_b = {},
  --     lualine_c = {},
  --     lualine_x = {},
  --     lualine_y = {},
  --     lualine_z = {'tabs'}
  -- },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}
