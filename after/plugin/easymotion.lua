local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.EasyMotion_smartcase = 1
vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_verbose = 0

keymap("n", "<Leader>", "<Plug>(easymotion-prefix)", opts)
