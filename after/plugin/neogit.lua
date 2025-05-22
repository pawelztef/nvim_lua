vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>Neogit<CR>", { silent = true })
-- vim.api.nvim_set_keymap("n", "<M-c>", "<cmd>Neogit commit<CR>", { silent = true })

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
    kind = "replace",
  },
  popup = {
    kind = "split",
  },
  commit_editor = {
    kind = "replace",
  },
  diff_view = {
    kind = "vsplit",
  },
  preview_buffer = {
    kind = "vsplit",
  },
  commit_view = {
    kind = "tab",
    verify_commit = vim.fn.executable("gpg") == 1,
  },
  kind = "replace",
  signs = {
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true
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
      folded = true,
      hidden = true
    },
    unmerged = {
      folded = false,
      hidden = false
    },
    recent = {
      folded = true
    },
  },
  mappings = {
    commit_editor = {
      ["q"]          = "Close",
      ["<m-p>"]      = "PrevMessage",
      ["<m-n>"]      = "NextMessage",
      ["<m-r>"]      = "ResetMessage",
      ["<cr>"] = "Submit",
      ["<c-[>"] = "Abort",
    },
    rebase_editor = {
      ["p"]          = "Pick",
      ["r"]          = "Reword",
      ["e"]          = "Edit",
      ["s"]          = "Squash",
      ["f"]          = "Fixup",
      ["x"]          = "Execute",
      ["d"]          = "Drop",
      ["b"]          = "Break",
      ["q"]          = "Close",
      ["<cr>"]       = "OpenCommit",
      ["gk"]         = "MoveUp",
      ["gj"]         = "MoveDown",
      ["<cr>"] = "Submit",
      ["<c-]>"] = "Abort",
      ["[c"]         = "OpenOrScrollUp",
      ["]c"]         = "OpenOrScrollDown",
    },
    rebase_editor_I = {
      ["<c-c><c-c>"] = "Submit",
      ["<c-c><c-k>"] = "Abort",
    },
    finder = {
      ["<cr>"]    = "Select",
      ["<c-c>"]   = "Close",
      ["<esc>"]   = "Close",
      ["<c-n>"]   = "Next",
      ["<c-p>"]   = "Previous",
      ["<down>"]  = "Next",
      ["<up>"]    = "Previous",
      ["<tab>"]   = "MultiselectToggleNext",
      ["<s-tab>"] = "MultiselectTogglePrevious",
    },
    popup = {
      ["?"] = "HelpPopup",
      ["A"] = "CherryPickPopup",
      ["B"] = "BisectPopup",
      ["b"] = "BranchPopup",
      ["c"] = false, 
      ["C"] = "CommitPopup",
      ["d"] = "DiffPopup",
      ["f"] = "FetchPopup",
      ["i"] = "IgnorePopup",
      -- ["l"] = "LogPopup",
      ["l"] = false,
      ["m"] = "MergePopup",
      ["M"] = "RemotePopup",
      ["p"] = "PullPopup",
      ["P"] = "PushPopup",
      ["r"] = "RebasePopup",
      ["t"] = "TagPopup",
      -- ["v"] = "RevertPopup",
      ["v"] = false,
      ["w"] = "WorktreePopup",
      ["X"] = "ResetPopup",
      ["Z"] = "StashPopup",
    },
    status = {
      ["q"]     = "Close",
      ["I"]     = "InitRepo",
      ["1"]     = "Depth1",
      ["2"]     = "Depth2",
      ["3"]     = "Depth3",
      ["4"]     = "Depth4",
      -- ["<tab>"] = "Toggle",
      ["o"]     = "Toggle",
      ["x"]     = "Discard",
      ["s"]     = "Stage",
      ["S"]     = "StageUnstaged",
      ["<c-s>"] = "StageAll",
      ["u"]     = "Unstage",
      ["U"]     = "UnstageStaged",
      ["y"]     = "ShowRefs",
      ["$"]     = "CommandHistory",
      -- ["#"]     = "Console",
      ["Y"]     = "YankSelected",
      ["<c-r>"] = "RefreshBuffer",
      ["<cr>"]  = "GoToFile",
      ["<c-v>"] = "VSplitOpen",
      ["<c-x>"] = "SplitOpen",
      ["<c-t>"] = "TabOpen",
      ["{"]     = "GoToPreviousHunkHeader",
      ["}"]     = "GoToNextHunkHeader",
      ["[c"]    = "OpenOrScrollUp",
      ["]c"]    = "OpenOrScrollDown",
      ["v"] = false,
    }
  },
}
