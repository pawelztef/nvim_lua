local codediff = require("codediff")

codediff.setup({
  -- highlights = {
  --   line_insert = "DiffviewDiffAdd",
  --   line_delete = "DiffviewDiffDelete",
  --   line_move = "DiffviewDiffChange",
  --   char_insert = "DiffviewDiffText",
  --   char_delete = "DiffviewDiffText",
  --   conflict_sign = "DiffviewFilePanelConflicts",
  --   conflict_sign_resolved = "DiffviewDim1",
  --   conflict_sign_accepted = "DiffviewStatusAdded",
  --   conflict_sign_rejected = "DiffviewStatusDeleted",
  -- },
  highlights = {
    line_insert = "#1d3042",
    line_delete = "#351d2b",
    line_move = "#5A391D",
    -- char_insert = "#3F5742",
    -- char_delete = "#351d2b",
    char_brightness = 1.8, -- Override auto-detection with explicit value
  },
  diff = {
    layout = "inline",
    disable_inlay_hints = false,
    max_computation_time_ms = 5000,
    ignore_trim_whitespace = false,
    hide_merge_artifacts = false,
    original_position = "left",
    conflict_ours_position = "right",
    conflict_result_position = "bottom",
    conflict_result_height = 30,
    conflict_result_width_ratio = { 1, 1, 1 },
    cycle_next_hunk = true,
    cycle_next_file = true,
    jump_to_first_change = true,
    highlight_priority = 100,
    compute_moves = false,
  },
  explorer = {
    position = "left",
    width = 50,
    height = 15,
    indent_markers = false,
    initial_focus = "modified",
    icons = {
      folder_closed = "",
      folder_open = "",
    },
    view_mode = "tree",
    flatten_dirs = true,
    file_filter = {
      ignore = { ".git/**", ".jj/**" },
    },
    focus_on_select = false,
    visible_groups = {
      staged = true,
      unstaged = true,
      conflicts = true,
    },
  },
  history = {
    position = "bottom",
    width = 50,
    height = 10,
    initial_focus = "history",
    view_mode = "list",
  },
  keymaps = {
    view = {
      quit = "<C-[>",
      toggle_explorer = "<leader>b",
      focus_explorer = "<leader>e",
      next_hunk = "cn",
      prev_hunk = "cp",
      next_file = "fn",
      prev_file = "fp",
      diff_get = "do",
      diff_put = "dp",
      open_in_prev_tab = "gf",
      close_on_open_in_prev_tab = true,
      toggle_stage = "s",
      stage_hunk = "y",
      unstage_hunk = "x",
      discard_hunk = "x",
      hunk_textobject = "ih",
      show_help = "g?",
      align_move = "gm",
      toggle_layout = "<C-f>",
    },
    explorer = {
      select = "<CR>",
      hover = "H",
      refresh = "R",
      toggle_view_mode = "f",
      stage_all = "S",
      unstage_all = "U",
      restore = "X",
      toggle_changes = "gu",
      toggle_staged = "gs",
      -- fold_open = "zo",
      -- fold_open_recursive = "zO",
      -- fold_close = "zc",
      -- fold_close_recursive = "zC",
      fold_toggle = "o",
      fold_toggle_recursive = "O",
      -- fold_open_all = "zR",
      -- fold_close_all = "zM",
    },
    history = {
      select = "<CR>",
      toggle_view_mode = "f",
      refresh = "R",
      -- fold_open = "zo",
      -- fold_open_recursive = "zO",
      -- fold_close = "zc",
      -- fold_close_recursive = "zC",
      fold_toggle = "o",
      fold_toggle_recursive = "O",
      -- fold_open_all = "zR",
      -- fold_close_all = "zM",
    },
    conflict = {
      accept_incoming = "<leader>ct",
      accept_current = "<leader>co",
      accept_both = "<leader>cb",
      discard = "<leader>cx",
      accept_all_incoming = "<leader>cT",
      accept_all_current = "<leader>cO",
      accept_all_both = "<leader>cB",
      discard_all = "<leader>cX",
      next_conflict = "]x",
      prev_conflict = "[x",
      diffget_incoming = "2do",
      diffget_current = "3do",
    },
  },
})

do
  local welcome_window = require("codediff.ui.view.welcome_window")
  local session = require("codediff.ui.lifecycle.session")
  local welcome_opts = {
    number = false,
    relativenumber = false,
    signcolumn = "no",
    foldcolumn = "0",
    statuscolumn = " ",
  }
  local function apply_opts_win(winid, opts)
    if not (winid and vim.api.nvim_win_is_valid(winid)) then
      return
    end
    vim.api.nvim_win_call(winid, function()
      for name, value in pairs(opts) do
        vim.api.nvim_set_option_value(name, value, { scope = "local" })
      end
    end)
  end
  function welcome_window.apply(winid)
    apply_opts_win(winid, welcome_opts)
  end
  function welcome_window.apply_normal(winid)
    if not (winid and vim.api.nvim_win_is_valid(winid)) then
      return
    end
    local active_diffs = session.get_active_diffs()
    local sess, side
    for _, s in pairs(active_diffs) do
      if s.original_win == winid then
        sess, side = s, "original"
        break
      end
      if s.modified_win == winid then
        sess, side = s, "modified"
        break
      end
    end
    if not sess or not side then
      return
    end
    welcome_window.capture_session_profiles(sess)
    local normal_opts = sess.window_profiles and sess.window_profiles[side]
    if not normal_opts then
      return
    end
    apply_opts_win(winid, normal_opts)
  end
end


local git = require("codediff.core.git")
local orig_apply_patch = git.apply_patch

function git.apply_patch(git_root, patch, patch_opts, callback)
  local stage_hunk = type(patch_opts) == "boolean" and patch_opts == false and type(callback) == "function"
  if not stage_hunk then
    return orig_apply_patch(git_root, patch, patch_opts, callback)
  end
  return orig_apply_patch(git_root, patch, patch_opts, function(err)
    callback(err)
    if err then
      return
    end
    local lifecycle = require("codediff.ui.lifecycle")
    local navigation = require("codediff.ui.view.navigation")
    local auto_refresh = require("codediff.ui.auto_refresh")
    local tabpage = vim.api.nvim_get_current_tabpage()
    if vim.api.nvim_tabpage_is_valid(tabpage) then
      auto_refresh.sync_mutable_buffers(tabpage)
    end
    local attempt = 0
    local max_attempts = 30
    local function try_next()
      attempt = attempt + 1
      if attempt > max_attempts then
        return
      end
      if not vim.api.nvim_tabpage_is_valid(tabpage) then
        return
      end
      local session = lifecycle.get_session(tabpage)
      if not session then
        return
      end
      local mod_win = session.modified_win
      if mod_win and vim.api.nvim_win_is_valid(mod_win) then
        vim.api.nvim_set_current_win(mod_win)
      end
      local changes = session.stored_diff_result and session.stored_diff_result.changes
      if not changes or #changes == 0 then
        return
      end
      if navigation.next_hunk() then
        return
      end
      vim.defer_fn(try_next, 50)
    end
    vim.defer_fn(try_next, 80)
  end)
end

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "CodeDiffOpen",
--   group = vim.api.nvim_create_augroup("codediff_hide_explorer", { clear = true }),
--   callback = function(args)
--     local data = args.data
--     if not data or data.mode ~= "explorer" then
--       return
--     end
--     vim.schedule(function()
--       local tabpage = data.tabpage
--       local lifecycle = require("codediff.ui.lifecycle")
--       local explorer = lifecycle.get_explorer(tabpage)
--       if explorer and not explorer.is_hidden then
--         require("codediff.ui.explorer.actions").toggle_visibility(explorer)
--       end
--       local sess = lifecycle.get_session(tabpage)
--       if sess and sess.modified_win and vim.api.nvim_win_is_valid(sess.modified_win) then
--         vim.api.nvim_set_current_win(sess.modified_win)
--       end
--     end)
--   end,
-- })

do
  local codediff_return_buf = nil
  local aug = vim.api.nvim_create_augroup("codediff_quit_landing", { clear = true })

  local function buf_is_usable_file(bufnr)
    if not bufnr or bufnr < 1 or not vim.api.nvim_buf_is_valid(bufnr) then
      return false
    end
    if vim.bo[bufnr].buflisted ~= true then
      return false
    end
    if vim.bo[bufnr].buftype ~= "" then
      return false
    end
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name == "" or name:find("CodeDiff", 1, true) then
      return false
    end
    return vim.fn.filereadable(name) == 1
  end

  local function sync_marked_path(tabpage)
    local lifecycle_ok, lifecycle = pcall(require, "codediff.ui.lifecycle")
    if not lifecycle_ok or not lifecycle then
      return nil
    end
    local sess = lifecycle.get_session(tabpage)
    if not sess then
      return nil
    end
    local panel = sess.explorer
    if not panel then
      return nil
    end
    if sess.mode == "history" and panel.current_file and panel.current_file ~= "" and sess.git_root then
      return vim.fs.joinpath(sess.git_root, panel.current_file)
    end
    if sess.mode == "explorer" and panel.current_file_path and panel.current_file_path ~= "" then
      if sess.git_root then
        return vim.fs.joinpath(sess.git_root, panel.current_file_path)
      end
      if panel.dir1 then
        return vim.fs.joinpath(panel.dir1, panel.current_file_path)
      end
    end
    return nil
  end

  local function try_edit(path)
    if not path or path == "" then
      return
    end
    local cur = vim.api.nvim_buf_get_name(0)
    if vim.fn.fnamemodify(cur, ":p") == vim.fn.fnamemodify(path, ":p") then
      return
    end
    vim.cmd("edit " .. vim.fn.fnameescape(path))
  end

  local function land_after_close(marked_path)
    if marked_path then
      try_edit(marked_path)
      return
    end
    if buf_is_usable_file(codediff_return_buf) then
      vim.api.nvim_set_current_buf(codediff_return_buf)
      return
    end
    local alt = vim.fn.bufnr("#")
    if buf_is_usable_file(alt) then
      vim.api.nvim_set_current_buf(alt)
      return
    end
    for _, f in ipairs(vim.v.oldfiles or {}) do
      if type(f) == "string" and f ~= "" and vim.fn.filereadable(f) == 1 and not f:find("CodeDiff", 1, true) then
        try_edit(f)
        return
      end
    end
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = "CodeDiffOpen",
    group = aug,
    callback = function()
      vim.schedule(function()
        local alt = vim.fn.bufnr("#")
        if buf_is_usable_file(alt) then
          codediff_return_buf = alt
        end
      end)
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "CodeDiffClose",
    group = aug,
    callback = function(args)
      local data = args.data
      if not data or not data.tabpage then
        return
      end
      local marked = sync_marked_path(data.tabpage)
      vim.schedule(function()
        land_after_close(marked)
      end)
    end,
  })
end

vim.keymap.set("n", "<leader>d", "<cmd>CodeDiff<CR>", { desc = "Toggle CodeDiff" })
vim.keymap.set("n", "<leader>dd", "<cmd>CodeDiff main<CR>", { desc = "Toggle CodeDiff" })
vim.keymap.set("n", "<leader>dh", "<cmd>CodeDiff history HEAD %<CR>", { desc = "Toggle CodeDiff history" })
vim.keymap.set("v", "<leader>dh", "<cmd>CodeDiff history %<CR>", { desc = "Toggle CodeDiff history" })
