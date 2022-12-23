require('focus').setup(
  {
      winhighlight = false,
      cursorline = false,
      number = false,
      singcolumn = false,
      absolutenumber_unfocussed = true,
  }
)
vim.api.nvim_set_keymap('n', '<leader>h', ':FocusSplitLeft<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':FocusSplitDown<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':FocusSplitUp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':FocusSplitRight<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':FocusToggle<CR>', { silent = true })


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

