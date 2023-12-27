vim.g.isort_vim_options = '--multi-line 3 --trailing-comma --force-grid-wrap 0 --use-parentheses --ensure-newline-before-comments --line-length 100'
vim.api.nvim_set_keymap("n", "<A-i>", "<cmd>Isort<CR>", {})
