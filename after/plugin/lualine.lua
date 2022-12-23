require('minimal-tabline').setup({
  enable = true,
  file_name = true,
  tab_index = false,
  pane_count = false,
  modified_sign = true,
  hide_on_single_tab = true,
  no_name = '[No Name]'
})

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'auto',
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
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', { 'filename', path = 1 } },
        lualine_c = { 'diagnostics' },
        lualine_x = {},
        lualine_y = { 'diff', 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
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
