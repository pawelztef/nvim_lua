local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>1", "<cmd>Startify<cr>", opts)

vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_session_persistence = 1
vim.g.startify_enable_special = 0
vim.g.startify_files_number = 7
vim.g.startify_padding_left = 3
vim.g.startify_session_number = 10
vim.g.startify_session_sort = 1
vim.g.startify_session_dir = '~/.config/nvim/session'

vim.g.startify_bookmarks = {
    { y = '~/.config/nvim/init.vim' },
    { z = '~/.zshrc' },
    { s = '~/.config/nvim/snips/python.snippets' },
    { t = '~/.config/nvim/todos.todo' },
}

vim.g.startify_lists = {
           { type = 'sessions',  header = {'SESSIONS'} },
           { type = 'files',     header = {'FILES'} },
           { type = 'bookmarks', header = {'BOOKMARKS'} },
}
vim.g.startify_custom_header = {}
vim.g.startify_custom_header_quotes = {
         {
          'Alea iacta est.',
          '',
          'The die has been cast.',
         },
 }

--[====[
function! GetUniqueSessionName()
  let path = fnamemodify(getcwd(), ':~:t')
  let path = empty(path) ? 'no-project' : path
  let branch = gitbranch#name()
  let branch = empty(branch) ? '' : '-' . branch
  return substitute(path . branch, '/', '-', 'g')
  return path
endfunction

autocmd User        StartifyReady silent execute 'SLoad '  . GetUniqueSessionName()
autocmd VimLeavePre *             silent execute 'SSave! ' . GetUniqueSessionName()
--]====]
