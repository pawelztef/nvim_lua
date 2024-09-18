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

local ignore_filetypes = { 'neo-tree', 'toggleterm', 'packer', 'NvimTree', 'no name', 'qf', 'undotree_2' }
-- local ignore_filename = { 'neo-tree', 'toggleterm', 'packer', 'NvimTree', 'no name', 'qf', 'undotree_2' }
local ignore_buftypes = { 'nofile', 'prompt', 'popup', 'quickfix', 'terminal', 'help', 'nowrite', 'readonly', 'packer', 'undotree_2' }

local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })

vim.api.nvim_create_autocmd('WinEnter', {
  group = augroup,
  callback = function(_)
    if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
    then
      vim.b.focus_disable = true
    else
      vim.b.focus_disable = false
    end
  end,
  desc = 'Disable focus autoresize for BufType',
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  callback = function(_)
    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
      vim.b.focus_disable = true
    else
      vim.b.focus_disable = false
    end
  end,
  desc = 'Disable focus autoresize for FileType',
})

-- vim.api.nvim_create_autocmd({'BufEnter', 'BufReadPost', 'WinEnter'}, {
--   group = augroup,
--   callback = function(_)
--     print('one')
--     if vim.tbl_contains(ignore_filename, vim.fn.expand('%:t'))
--     then
--       print('two')
--       vim.b.focus_disable = true
--     else
--       vim.b.focus_disable = false
--     end
--   end,
--   desc = 'Disable focus autoresize for Filename',
-- })


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
