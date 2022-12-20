local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

keymap("n", "<C-q>", ":qa!<CR>", opts)              --closing
keymap("n", "<leader>j", ":vsp<CR>", opts)          --vertical split
keymap("n", "<leader>k", ":sp<CR>", opts)           --horizontal split
keymap("n", "oo", "o<Esc>k", opts)                  --mapping for opening new line without entering into insert mode
keymap("n", "OO", "O<Esc>j", opts)                  --mapping for opening new line without entering into insert mode
keymap("n", "<leader><tab>", "<C-W>w", opts)
keymap("n", "<leader><tab>r", "<C-W>R", opts)
--move text upa and down
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
--clipboard
keymap("x", "<leader>p", "\"_dP", opts)
--quickfix locationlist navigation
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts)


