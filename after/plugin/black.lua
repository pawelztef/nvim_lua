vim.g.python3_host_prog = os.getenv("HOME") .. '/.local/venv/nvim/bin/python'
-- Key mappings
vim.api.nvim_buf_set_keymap(0, 'n', '<A-o>', '<cmd>lua Black()<CR>', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'i', '<A-o>', '<cmd>lua Black()<CR>', { noremap = true, silent = true })
-- Global settings
vim.g.black_settings = { fast = 1, line_length = 130 }

