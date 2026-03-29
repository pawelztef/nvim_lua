require('focus').setup(
  {
    ui = {
      winhighlight = false,
      cursorline = false,
      number = false,
      singcolumn = true,
      absolutenumber_unfocussed = true,
    }
  }
)
vim.api.nvim_set_keymap('n', '<leader>h', ':FocusSplitLeft<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':FocusSplitDown<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':FocusSplitUp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':FocusSplitRight<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':FocusToggle<CR>', { silent = true })

local ignore_filetypes = {
  'neo-tree',
  'toggleterm',
  'packer',
  'NvimTree',
  'no name',
  'qf',
  'undotree_2',
  'aerial',
  'codediff-explorer',
  'codediff-history',
  'codediff-help',
}
local ignore_filename = { 'no name', '' }
local ignore_buftypes = {
  'nofile',
  'prompt',
  'popup',
  'quickfix',
  'terminal',
  'help',
  'nowrite',
  'readonly',
  'packer',
  'undotree_2',
  'aerial',
}

local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })

local function sync_focus_disable_for_buffer()
  local name = vim.fn.expand('%:t')
  local disable = vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
    or vim.tbl_contains(ignore_filetypes, vim.bo.filetype)
    or vim.tbl_contains(ignore_filename, name)
    or vim.startswith(vim.api.nvim_buf_get_name(0), 'CodeDiff Explorer [')
  vim.b.focus_disable = disable
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufReadPost', 'WinEnter', 'FileType' }, {
  group = augroup,
  callback = sync_focus_disable_for_buffer,
  desc = 'Disable focus autoresize for excluded buffers',
})


-- COMMANDS
--
-- :FocusDisable          Disable the plugin per session. Splits will be normalised back to defaults and then spaced evenly.
-- :FocusEnable           Enable the plugin per session. Splits will be resized back to your configs or defaults if not set.
-- :FocusToggle           Toggle focus on and off again.
-- :FocusSplitNicely      Split a window based on the golden ratio rule
-- :FocusSplitCycle       If there are no splits, create one and move to it, else cycle focussed split. :FocusSplitCycle reverse for counterclockwise
-- :FocusSplitLeft        Move to existing or create a new split to the left of your current window + open file or custom command
-- :FocusSplitDown        Move to existing or create a new split to the bottom of your current window + open file or custom command
-- :FocusSplitUp          Move to existing or create a new split to the top of your current window + open file or custom command
-- :FocusSplitRight       Move to existing or create a new split to the right of your current window + open file or custom command
-- :FocusEqualise         Temporarily equalises the splits so they are ll of similar width/height
-- :FocusMaximise         Temporarily maximises the focussed window
-- :FocusMaxOrEqual       Toggles Between having the splits equalised or the focussed window maximiseda
