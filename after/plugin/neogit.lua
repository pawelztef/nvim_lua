vim.api.nvim_set_keymap("n", "<F3>", "<cmd>Neogit<CR>", { silent = true })

local neogit = require("neogit")
neogit.setup {
    disable_signs = false,
    disable_hint = false,
    disable_commit_confirmation = false,
    auto_refresh = true,
    disable_builtin_notifications = false,
    use_magit_keybindings = false,
    disable_context_highlighting = true,
    push_popup = false,
    commit_popup = {
        kind = "split",
    },
    popup = {
        kind = "split",
    },
    kind = "tab",
    signs = {
        section = { ">", "v" },
        item = { ">", "v" },
        hunk = { "", "" },
    },
    integrations = {
        'TimUntersberger/neogit',
        requires = { 
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
        },
        diffview = true,
    },
    sections = {
        untracked = {
            folded = false
        },
        unstaged = {
            folded = false
        },
        staged = {
            folded = false
        },
        stashes = {
            folded = true
        },
        unpulled = {
            folded = true
        },
        unmerged = {
            folded = false
        },
        recent = {
            folded = true
        },
    },
    mappings = {
        status = {
            ["o"] = "Toggle",
        },
    },
}

