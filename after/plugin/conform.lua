local conform = require("conform")

conform.setup({
  format = {
    timeout_ms = 3000,
    async = false, -- not recommended to change
    quiet = false, -- not recommended to change
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { "eslint", "prettier", "prettierd", stop_after_first = true },
    html = { "prettier" },
    json = { "jq" },
  },
})


conform.formatters.prettier = {
  prepend_args = {
    "--print-width 200",
    "--tab-width", "4",
    "--use-tabs", "false",
  },
}
vim.keymap.set({ "n", "v" }, "<M-f>", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 3000,
  })
end, { desc = "Format file or range (in visual mode)" })
