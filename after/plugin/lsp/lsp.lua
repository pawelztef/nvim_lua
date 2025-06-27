require('lspconfig.ui.windows').default_options.border = 'single'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<C-d>", '<cmd>lua vim.diagnostic.open_float(nil, {border="single", focus=false})<CR>', opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<M-f>', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
    vim.keymap.set("i", "<C-n>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
    vim.keymap.set("s", "<C-n>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
    vim.keymap.set("i", "<C-p>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
    vim.keymap.set("s", "<C-p>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
  end,
})

vim.diagnostic.config({ virtual_text = false, virtual_lines = false })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.diagnostic.config({
      virtual_lines = false,
      virtual_text = false,
      underline = false,
      signs = true,
      severity_sort = true,
      float = {
        source = "always",
        border = "rounded",
        focusable = true,
        header = false,
      },
    })
  end,
})


require('lspconfig').eslint.setup {
  max_length = 4000
}
vim.fn.sign_define("DiagnosticSignError", { text = "▪", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "▪", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "▪", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "▪", texthl = "DiagnosticSignHint" })

vim.keymap.set('', '<leader>bl', function()
  vim.diagnostic.config({
    virtual_lines = not vim.diagnostic.config().virtual_lines,
    virtual_text = false,
  })
end, { desc = 'Toggle diagnostic [l]ines' })
