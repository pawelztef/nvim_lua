local capabilities = vim.lsp.protocol.make_client_capabilities()

require('lspconfig').pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        pyright = { enabled = false },
        pylsp = { enabled = false },
        black = { enabled = true }, -- Enable Black formatter
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
  capabilities = capabilities,
})
