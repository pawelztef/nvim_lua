local notify = require('notify')

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

keymap("n", "<A-z>", ":qa!<CR>", opts)     --closing
keymap("n", "<leader>z", ":q!<CR>", opts)  --closing
-- keymap("n", "<leader>q", ":tabclose<CR>", opts) --closing
keymap("n", "<leader>j", ":vsp<CR>", opts) --vertical split
keymap("n", "<leader>k", ":sp<CR>", opts)  --horizontal split
keymap("n", "oo", "o<Esc>k", opts)         --mapping for opening new line without entering into insert mode
keymap("n", "OO", "O<Esc>j", opts)         --mapping for opening new line without entering into insert mode
keymap("n", "<leader><tab>", "<C-W>w", opts)
keymap("n", "<leader><tab>r", "<C-W>R", opts)
keymap("n", "gf", "<C-W>gf", opts)
keymap("v", "gf", "<C-W>gf", opts)
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
  notify(path, "info", { title = "Copied relative path" })
end, {}
)

vim.api.nvim_create_user_command("CopyRelPathForImport", function()
  -- Get the relative path of the current file
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
  -- Replace directory separators with dots and remove the file extension
  local modified_path = path:gsub("/", "."):gsub("%.[^%.]+$", "")
  -- Copy the modified path to the clipboard
  vim.api.nvim_call_function("setreg", { "+", modified_path })
  -- Print and notify the user of the copied path
  print(modified_path)
  vim.notify(modified_path, "info", { title = "Copied for imports" })
end, {})

vim.api.nvim_create_user_command("CopyAbsPath", function()
  path = vim.fn.fnamemodify(vim.fn.expand("%"), ":p")
  vim.api.nvim_call_function("setreg", { "+", path })
  print(path)
  notify(path, "info", { title = "Copied absolute path" })
end, {}
)
vim.api.nvim_create_user_command("CopyFileName", function()
  path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":t")
  vim.api.nvim_call_function("setreg", { "+", path })
  print(path)
  notify(path, "info", { title = "Copied file name" })
end, {}
)
vim.api.nvim_create_user_command("CopyDirPath", function()
  path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.:h")
  vim.api.nvim_call_function("setreg", { "+", path })
  print(path)
  notify(path, "info", { title = "Copied dir path" })
end, {}
)
-- keymap("n", "cp", "<cmd>CopyRelPath<CR>", opts)
keymap("n", "cp", "<cmd>CopyRelPathForImport<CR>", opts)
keymap("n", "ca", "<cmd>CopyAbsPath<CR>", opts)
keymap("n", "cf", "<cmd>CopyFileName<CR>", opts)
keymap("n", "cd", "<cmd>CopyDirPath<CR>", opts)
keymap("n", "bda", "<cmd>%bd|e#|bd#<CR>", opts)
keymap("n", "bd", "<cmd>bd<CR>", opts)
keymap("n", "<leader>f", "<cmd>Format<CR>", opts)
keymap("n", "<leader>nt", "<cmd>set relativenumber!<CR>", opts)

-- local function IsortAndBlack()
-- vim.cmd('Black')
-- vim.cmd('Isort')
-- end

-- vim.keymap.set("n", "<A-0>", IsortAndBlack)

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
-- Map Ctrl+[ to Escape in normal mode
-- vim.keymap.set('n', '<C-[>', '<Esc>', { noremap = true, silent = true })
-- -- Map Ctrl+[ to Escape in insert mode
-- vim.keymap.set('i', '<C-[>', '<Esc>', { noremap = true, silent = true })
-- -- Map Ctrl+[ to Escape in visual mode
-- vim.keymap.set('v', '<C-[>', '<Esc>', { noremap = true, silent = true })

