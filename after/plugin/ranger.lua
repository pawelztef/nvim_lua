local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>RangerWorkingDirectory<CR>", opts)
vim.api.nvim_set_var('ranger_command_override', 'ranger --cmd "set show_hidden=true"')

