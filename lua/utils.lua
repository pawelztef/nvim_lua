-- vim.api.nvim_create_user_command(
--     'Is',
--     'call Isort()',
--     { bang = true }
-- )
-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- General settings:
--------------------

-- Highlight on yank
-- augroup('YankHighlight', { clear = true })
-- autocmd('TextYankPost', {
--   group = 'YankHighlight',
--   callback = function()
--     vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
--   end
-- })

-- Auto save
autocmd({ 'InsertLeave', 'TextChanged' }, {
  pattern = '',
  callback = function()
    if vim.bo.modifiable then
      vim.cmd('silent! update')
      vim.fn.timer_start(900, function()
        print(' ')
      end)
    end
  end
})

-- manage highlight search
vim.api.nvim_exec([[
  augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\\? :set hlsearch
    autocmd CmdlineLeave /,\\? :set nohlsearch
  augroup END
]], false)


-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Settings for filetypes:
--------------------------

-- Disable line length marker
-- augroup('setLineLength', { clear = true })
-- autocmd('Filetype', {
--   group = 'setLineLength',
--   pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
--   command = 'setlocal cc=0'
-- })

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript', 'yaml', 'lua' },
  command = 'setlocal shiftwidth=2 tabstop=2'
})
-- Ejs highlighting fix
autocmd('BufRead', {
  pattern = '*.ejs',
  command = 'set filetype=html'
})
autocmd('BufNewFile', {
  pattern = '*.ejs',
  command = 'set filetype=html'
})

-- Terminal settings:
---------------------

-- -- Open a Terminal on the right tab
-- autocmd('CmdlineEnter', {
--   command = 'command! Term :botright vsplit term://$SHELL'
-- })

-- Enter insert mode when switching to terminal
-- autocmd('TermOpen', {
--   command = 'setlocal listchars= nonumber norelativenumber nocursorline',
-- })

-- autocmd('TermOpen', {
--   pattern = '',
--   command = 'startinsert'
-- })

-- Close terminal buffer on process exit
-- autocmd('BufLeave', {
--   pattern = 'term://*',
--   command = 'stopinsert'
-- })

-- Cleaning before exit nvim
----------------------------
local function cleanOnExit()
  vim.cmd('AerialCloseAll')
  vim.cmd('lua require("neogit").close()')
  -- vim.cmd('TagbarClose')
end

autocmd('VimLeavePre', {
  pattern = '',
  callback = cleanOnExit,
})


-- Position the (global) quickfix window at the very bottom of the window
-- (useful for making sure that it appears underneath splits)
-- NOTE: Using a check here to make sure that window-specific location-lists
-- aren't effected, as they use the same `FileType` as quickfix-lists.
vim.cmd [[
augroup FileTypeQF
  autocmd!
  autocmd FileType qf lua if vim.fn.getwininfo(vim.fn.win_getid())[1].loclist ~= 1 then vim.cmd('wincmd J') vim.cmd('resize 10') end
augroup END
]]


-- Open last commited files
function OpenLastCommittedFiles()
  local files = vim.fn.systemlist('git diff-tree --no-commit-id --name-only -r HEAD')
  for _, file in ipairs(files) do
    vim.cmd('edit ' .. file)
  end
  vim.cmd('echo "Last commited files added to buffer"')
  vim.fn.timer_start(900, function()
    print(' ')
  end)
end

vim.api.nvim_set_keymap('n', '<leader>4', ':lua OpenLastCommittedFiles()<CR>', { noremap = true, silent = true })
