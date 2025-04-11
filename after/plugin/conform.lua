local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettier" },
  },
})


conform.formatters.prettier = {
  prepend_args = {
    "--print-width 200",
    "--tab-width 8",
  },
}
vim.keymap.set({ "n", "v" }, "<M-f>", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end, { desc = "Format file or range (in visual mode)" })
