vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
vim.g.gitblame_date_format = '%d/%m/%y'
vim.g.gitblame_message_template = '<author> • <date> • <summary>'
local git_blame = require('gitblame')

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
        symbols = {
            modified = '',      -- Text to show when the file is modified.
            readonly = '[readonly]',      -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[no name]', -- Text to show for unnamed buffers.
            newfile = '[new]',     -- Text to show for newly created file before first write
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
        lualine_c = { 'diff', 'diagnostics' },
        lualine_x = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
        lualine_y = { 'branch' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path= 0 } },
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
