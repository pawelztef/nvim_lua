local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.EasyMotion_smartcase = 1
keymap("n", "<Leader>", "<Plug>(easymotion-prefix)", opts)
