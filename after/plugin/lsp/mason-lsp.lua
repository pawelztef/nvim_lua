require("mason").setup({
  ui = {
    border = 'single',
    width = 0.6,
    height = 0.7
  }
})
require("mason-lspconfig").setup {
    ensure_installed = {
    'ts_ls',
    'eslint',
    'lua_ls',
    'bashls',
    'cssls',
    'dockerls',
    'emmet_ls',
    'html',
    'jsonls',
    'zk',
    'yamlls',
    'intelephense',
   },
}
