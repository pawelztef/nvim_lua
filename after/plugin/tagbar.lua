local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n",  "<leader>a", ":TagbarToggle<CR>", opts)

vim.g.bookmark_display_annotation = 1
vim.g.tagbar_sort = 0
vim.g.tagbar_compact = 2
vim.g.tagbar_autoclose = 0
vim.g.tagbar_width = math.max(60, vim.fn.winwidth(0) / 5)
vim.g.tagbar_show_data_type = 0
vim.g.tagbar_show_visibility = 2
vim.g.tagbar_autofocus = 1
vim.g.tagbar_autopreview = 0
vim.g.tagbar_foldlevel = 10
vim.g.tagbar_map_showproto = '<F12>'
vim.g.tagbar_show_tag_linenumbers=1
vim.g.tagbar_show_tag_count=1
vim.g.tagbar_silent = 1
vim.g.tagbar_no_status_line = 1
vim.g.tagbar_case_insensitive = 1
vim.g.tagbar_show_data_type = 0
vim.g.tagbar_show_visibility = 1
vim.g.tagbar_visibility_symbols = { public = " ", protected = " ", private = " " }

