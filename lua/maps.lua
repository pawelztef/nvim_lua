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
keymap("n", "qn", "<cmd>cnext<CR>zz", opts)
keymap("n", "qp", "<cmd>cprev<CR>zz", opts)
keymap("n", "ln", "<cmd>lnext<CR>zz", opts)
keymap("n", "lp", "<cmd>lprev<CR>zz", opts)
keymap("n", "^]", "<cmd>tabclose<CR>", opts)

vim.api.nvim_create_user_command("CopyRelPath", function()
  path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
  vim.api.nvim_call_function("setreg", { "+", path })
  print(path)
end, {}
)
vim.api.nvim_create_user_command("CopyAbsPath", function()
  path = vim.fn.fnamemodify(vim.fn.expand("%"), ":p")
  vim.api.nvim_call_function("setreg", { "+", path })
  print(path)
end, {}
)
vim.api.nvim_create_user_command("CopyFileName", function()
  path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":t")
  vim.api.nvim_call_function("setreg", { "+", path })
  print(path)
end, {}
)
vim.api.nvim_create_user_command("CopyDirPath", function()
  path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.:h")
  vim.api.nvim_call_function("setreg", { "+", path })
  print(path)
end, {}
)
keymap("n", "cp", "<cmd>CopyRelPath<CR>", opts)
keymap("n", "ca", "<cmd>CopyAbsPath<CR>", opts)
keymap("n", "cf", "<cmd>CopyFileName<CR>", opts)
keymap("n", "cd", "<cmd>CopyDirPath<CR>", opts)
keymap("n", "bda", "<cmd>%bd|e#|bd#<CR>", opts)
keymap("n", "bd", "<cmd>bd<CR>", opts)
keymap("n", "<leader>f", "<cmd>Format<CR>", opts)
keymap("n", "<leader>nt", "<cmd>set relativenumber!<CR>", opts)

local function IsortAndBlack()
  vim.cmd('Isort')
  vim.cmd('Black')
end

vim.keymap.set("n", "<A-0>", IsortAndBlack)

-- clean quickfix
local function ClearQuickfixList()
  vim.cmd('copen')
  vim.cmd('call setqflist([])')
  vim.cmd('quit')
end

vim.keymap.set("n", "<C-d>", ClearQuickfixList)

-- toggle quickfix
local function toggle_qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
end

vim.keymap.set("n", "<leader>b", toggle_qf)
