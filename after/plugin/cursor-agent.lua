require("cursor-agent").setup({
  cursor_window_keys = {
    terminal_mode = {
      help = { "??", "F1" },
      toggle_width = { "<C-f>" },
    },
    normal_mode = {
      hide = { "<Esc>", "q" },
    },
  },
})
 -- vim.keymap.set("v", "<leader>cs", ":CursorAgentSelection<CR>", { desc = "Cursor Agent: Send selection" })
