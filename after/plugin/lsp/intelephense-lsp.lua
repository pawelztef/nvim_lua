local capabilities = vim.lsp.protocol.make_client_capabilities()

require('lspconfig').intelephense.setup({
  capabilities = capabilities,
  filetypes = { 'php' },
})
