local capabilities = vim.lsp.protocol.make_client_capabilities()

require('lspconfig').pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { maxLineLength = 120 },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
  capabilities = capabilities,
})
