local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')
require('telescope').load_extension('projects')

vim.keymap.set('n', '<leader>0', builtin.find_files, {})
vim.keymap.set('n', '<leader>8', builtin.live_grep, {})
vim.keymap.set('n', '<leader>9', builtin.buffers, {})
vim.keymap.set('n', '<leader>p', "<cmd>Telescope projects<cr>", {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>tm', builtin.marks, {})
vim.keymap.set('n', '<leader>tr', builtin.registers, {})
vim.keymap.set('n', '<leader>tb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>tq', builtin.quickfix, {})

require('telescope').setup {
    pickers = {
        buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
        },
        git_branches = {
            sort_lastused = true,
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
    defaults = {
        layout_strategy = 'vertical',
        mappings = {
            i = {
                ['<C-[>'] = actions.close,
                ['<C-q>'] = actions.smart_add_to_qflist + actions.open_qflist,
                ['<C-s>'] = actions.smart_send_to_loclist + actions.open_loclist,
                ['<C-y>'] = function(prompt_bufnr)
                    action_layout.cycle_layout_next(prompt_bufnr)
                end,
            },
        },
    },
}
-- nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
-- vim.keymap.set('n', '<Leader>f',  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>", {})
