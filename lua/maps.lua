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

local function relpath()
  return vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
end

vim.api.nvim_create_user_command("CopyRelPathWithLine", function()
  local path = relpath()
  local line = vim.fn.line(".")
  local text = path .. ":" .. line
  vim.fn.setreg("+", text)
  notify(text, "info", { title = "Copied relative path with line" })
end, {})

vim.api.nvim_create_user_command("CopyRelPathWithRange", function()
  local path = relpath()
  local line_start, col_start = vim.fn.line("'<"), vim.fn.col("'<")
  local line_end, col_end = vim.fn.line("'>"), vim.fn.col("'>")
  local text = string.format("%s:%d:%d-%d:%d", path, line_start, col_start, line_end, col_end)
  vim.fn.setreg("+", text)
  notify(text, "info", { title = "Copied relative path with line:col range" })
end, { range = true })

vim.api.nvim_create_user_command("CopyRelPathForImport", function()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
  local modified_path = path:gsub("/", "."):gsub("%.[^%.]+$", "")
  vim.api.nvim_call_function("setreg", { "+", modified_path })
  print(modified_path)
  notify(modified_path, "info", { title = "Copied for imports" })
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

keymap("n", "cp", "<cmd>CopyRelPath<CR>", opts)
keymap("n", "<leader>cp", "<cmd>CopyRelPathWithLine<CR>", opts)
keymap("v", "<leader>cp", "<cmd>CopyRelPathWithRange<CR>", opts)
keymap("n", "cP", "<cmd>CopyRelPathForImport<CR>", opts)
keymap("n", "ca", "<cmd>CopyAbsPath<CR>", opts)
keymap("n", "cf", "<cmd>CopyFileName<CR>", opts)
keymap("n", "cd", "<cmd>CopyDirPath<CR>", opts)
keymap("n", "bda", "<cmd>%bd|e#|bd#<CR>", opts)
keymap("n", "bd", "<cmd>bd<CR>", opts)
keymap("n", "<leader>f", "<cmd>Format<CR>", opts)
keymap("n", "<leader>nt", "<cmd>set relativenumber!<CR>", opts)


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
    return
  end
  notify("Custom Mapping", "info", { title = "Quickfix list is empty" })
end
-- vim.keymap.set("n", "<leader>bb", toggle_qf)

local function ClearQuickfixList()
  vim.fn.setqflist({})
  toggle_qf()
  notify("Custom Mapping", "info", { title = "Quickfix list cleared" })
end
vim.keymap.set("n", "<leader>bd", ClearQuickfixList, opts)

-- Map Ctrl+[ to Escape in normal mode
-- vim.keymap.set('n', '<C-[>', '<Esc>', { noremap = true, silent = true })
-- -- Map Ctrl+[ to Escape in insert mode
-- vim.keymap.set('i', '<C-[>', '<Esc>', { noremap = true, silent = true })
-- -- Map Ctrl+[ to Escape in visual mode
-- vim.keymap.set('v', '<C-[>', '<Esc>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- vim.keymap.set("n", "<space>ag", function()
--   local total_width = vim.api.nvim_get_option("columns")
--   local width_30_percent = math.floor(total_width * 0.3)
--   vim.cmd.vnew()
--   vim.cmd.term()
--   vim.api.nvim_win_set_width(0, width_30_percent)
-- end)

local term_bufnr = nil
vim.keymap.set("n", "<space>tg", function()
  -- Check if the terminal buffer is already open and valid
  if term_bufnr and vim.api.nvim_buf_is_valid(term_bufnr) then
    -- Find the window containing the terminal buffer
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == term_bufnr then
        -- Close the window if it's open
        vim.api.nvim_win_close(win, true)
        return
      end
    end
    -- If the terminal buffer is valid but not visible, open it in a new vertical split
    vim.cmd.vnew()
    vim.api.nvim_win_set_buf(0, term_bufnr)
    local total_width = vim.api.nvim_get_option("columns")
    local width_30_percent = math.floor(total_width * 0.3)
    vim.api.nvim_win_set_width(0, width_30_percent)
  else
    -- If the terminal buffer is not valid, create a new terminal
    vim.cmd.vnew()
    local total_width = vim.api.nvim_get_option("columns")
    local width_30_percent = math.floor(total_width * 0.3)
    vim.api.nvim_win_set_width(0, width_30_percent)
    vim.cmd.term("gemini")
    term_bufnr = vim.api.nvim_get_current_buf()
  end
end)
