local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
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
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
cmp_mappings['<C-p>'] = nil
cmp_mappings['<C-n>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = {
    { name = "luasnip", priority_weight = 9 },
    { name = 'nvim_lsp', priority_weight = 0 },
  },
})
local cmp = require("cmp")
local types = require("cmp.types")

local function deprioritize_snippet(entry1, entry2)
  if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then return false end
  if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then return true end
end

cmp.setup({
  window = {
    completion = cmp.config.window.bordered({
      -- winhighlight = "FloatBorder:Folded"
    }),
    documentation = cmp.config.window.bordered({
      -- winhighlight = "FloatBorder:Folded"
    }),
  },
  mapping = cmp_mappings,
  sources = {
    { name = "luasnip", priority_weight = 9 },
    { name = 'nvim_lsp', priority_weight = 0 },
  },
})
lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = '*',
    warn = '*',
    hint = '*',
    info = '*'
  }
}
)
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  if client.name == "eslint" then
    vim.cmd.LspStop('eslint')
    return
  end

  vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<M-f>', function()
    vim.lsp.buf.format { async = true }
  end, opts)
  vim.keymap.set("i", "<C-n>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
  vim.keymap.set("s", "<C-n>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
  vim.keymap.set("i", "<C-p>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
  vim.keymap.set("s", "<C-p>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  -- virtual_text = { spacing = 15 },
  virtual_text = false,
  signs = true,
  update_in_insert = false
})
require 'lspconfig'.eslint.setup {
  max_length = 4000
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').emmet_ls.setup({
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
    "ejs"
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  }
})

require('lspconfig').intelephense.setup({
  capabilities = capabilities,
  filetypes = { 'php' },
})

-- local function organize_imports()
--   local params = {
--     command = "_typescript.organizeImports",
--     arguments = {vim.api.nvim_buf_get_name(0)},
--     title = ""
--   }
--   vim.lsp.buf.execute_command(params)
-- end

-- require('lspconfig').tsserver.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   commands = {
--     Imports = {
--       organize_imports,
--       description = "Organize Imports"
--     }
--   }
-- }
