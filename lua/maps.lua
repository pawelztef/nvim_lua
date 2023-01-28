local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

keymap("n", "<A-z>", ":qa!<CR>", opts) --closing
keymap("n", "<leader>z", ":q!<CR>", opts) --closing
-- keymap("n", "<leader>q", ":tabclose<CR>", opts) --closing
keymap("n", "<leader>j", ":vsp<CR>", opts) --vertical split
keymap("n", "<leader>k", ":sp<CR>", opts) --horizontal split
keymap("n", "oo", "o<Esc>k", opts) --mapping for opening new line without entering into insert mode
keymap("n", "OO", "O<Esc>j", opts) --mapping for opening new line without entering into insert mode
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
keymap("n", "<A-k>", "<cmd>lnext<CR>zz", opts)
keymap("n", "<A-j>", "<cmd>lprev<CR>zz", opts)

vim.api.nvim_create_user_command("CopyRelPath", function()
    vim.api.nvim_call_function("setreg", { "+", vim.fn.fnamemodify(vim.fn.expand("%"), ":.") })
end, {}
)
vim.api.nvim_create_user_command("CopyAbsPath", function()
    vim.api.nvim_call_function("setreg", { "+", vim.fn.fnamemodify(vim.fn.expand("%"), ":p") })
end, {}
)
vim.api.nvim_create_user_command("CopyFileName", function()
    vim.api.nvim_call_function("setreg", { "+", vim.fn.fnamemodify(vim.fn.expand("%:p"), ":t") })
end, {}
)
vim.api.nvim_create_user_command("CopyDirPath", function()
    vim.api.nvim_call_function("setreg", { "+", vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.:h") })
end, {}
)
keymap("n", "cp", "<cmd>CopyRelPath<CR>", opts)
keymap("n", "ca", "<cmd>CopyAbsPath<CR>", opts)
keymap("n", "cf", "<cmd>CopyFileName<CR>", opts)
keymap("n", "cd", "<cmd>CopyDirPath<CR>", opts)
keymap("n", "bda", "<cmd>%bd|e#|bd#<CR>", opts)
keymap("n", "<leader>f", "<cmd>Format<CR>", opts)
keymap("n", "<leader>nt", "<cmd>set relativenumber!<CR>", opts)
