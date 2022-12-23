local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>RnvimrToggle<CR>", opts)

vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_enable_bw = 1
vim.g.rmvimr_edit_cmd = 'drop'
