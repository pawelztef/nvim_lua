local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')
require('telescope').load_extension('project')

vim.keymap.set('n', '<leader>0', builtin.find_files, {})
vim.keymap.set('n', '<leader>9', builtin.buffers, {})
vim.keymap.set('n', '<leader>8', builtin.live_grep, {})
vim.keymap.set('n', '<leader>7', builtin.grep_string, {})
vim.keymap.set('n', '<leader>6', "<cmd>Telescope diagnostics<cr>", {})
vim.keymap.set('n', '<leader>5', builtin.git_branches, {})
vim.keymap.set('n', '<leader>4', builtin.git_status, {})
-- search in open buffers
vim.keymap.set(
  'n',
  '<leader>o',
  '<cmd>lua require("telescope.builtin").live_grep({ prompt_title = "Find in open buffers", grep_open_files = true})<cr>'
  ,
  {}
)
-- search in current file
vim.keymap.set(
  'n',
  '<leader>i',
  '<cmd>lua require("telescope.builtin").grep_string({ prompt_title = "Find in open file", search_dirs = {vim.fn.expand("%:p")}})<cr>'
  ,
  {}
)
vim.keymap.set(
  'n',
  '<Leader>p',
  "<cmd>lua require'telescope'.load_extension('project').project{}<cr>"
  ,
  {}
)
vim.keymap.set(
  'n',
  '<leader>m',
  "<cmd>lua require'telescope'.load_extension('vim_bookmarks').all()<cr>",
  {}
)

vim.keymap.set('n', '<leader>tt', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>tr', builtin.registers, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>tb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>b', builtin.quickfix, {})

require('telescope').setup {
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
    },
    git_branches = {
      ignore_current_buffer = true,
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    project = {
      base_dirs = {
        { path = '~/projects',           max_depth = 1 },
        { path = '~/projects/core' },
        { path = '~/.config/nvim' },
        { path = '~/projects/tutorials', max_depth = 3 },
      },
      sync_with_nvim_tree = true,
      display_type = 'minimal',
      order_by = 'recent',
      hide_workspace = true,
    },
  },
  defaults = {
    layout_strategy = 'vertical',
    sorting_strategy = 'ascending',
    prompt_position = 'top',
    layout_config = {
      height = 0.80,
      width = 0.75,
      vertical = {
        preview_height = 0.65,
        prompt_position = 'top',
      },
      horizontal = {
        preview_width = 0.62,
      }
    },
    mappings = {
      i = {
        ['<M-d>'] = actions.delete_buffer,
        ['<C-[>'] = actions.close,
        ['<C-q>'] = actions.smart_add_to_qflist + actions.open_qflist,
        ['<C-s>'] = actions.smart_send_to_loclist + actions.open_loclist,
        ['<C-y>'] = function(prompt_bufnr)
          action_layout.cycle_layout_next(prompt_bufnr)
        end,
      },
      n = {
        ['<M-d>'] = actions.delete_buffer,
        ['<C-y>'] = function(prompt_bufnr)
          action_layout.cycle_layout_next(prompt_bufnr)
        end,
      }
    },
  },
}
local bookmark_actions = require('telescope').extensions.vim_bookmarks.actions
require('telescope').extensions.vim_bookmarks.all {
  attach_mappings = function(_, map)
    map('i', '<M-d>', bookmark_actions.delete_selected_or_at_cursor)

    return true
  end
}
-- nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
-- vim.keymap.set('n', '<Leader>f',  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>", {})
