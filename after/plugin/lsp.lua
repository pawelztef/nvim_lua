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
        globals = { 'vim' },
      }
    }
  }
})





local cmp = require('cmp')
local cmp_types = require("cmp.types")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ['<C-p>'] = nil,
  ['<C-n>'] = nil,
  ['<Tab>'] = cmp.mapping(
    function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    { 'i', 's' }
  ),
  ["<S-Tab>"] = cmp.mapping(
    function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
    { "i", "s" }
  ),
  ['<C-CR>'] = cmp.mapping(
    cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    { 'i', 'c' }
  ),
  ['<C-k>'] = cmp.mapping(
    cmp.mapping.select_prev_item(cmp_select),
    { 'i', 'c' }
  ),
  ['<C-j>'] = cmp.mapping(
    cmp.mapping.select_next_item(cmp_select),
    { 'i', 'c' }
  )
})


lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = {
    { name = 'treesitter', priority_weight = 4 },
    { name = 'buffer',     priority_weight = 6 },
    { name = 'path',       priority_weight = 3 },
    { name = "luasnip",    priority_weight = 5 },
    { name = 'nvim_lsp',   priority_weight = 2 },
    { name = "emmet_ls",   priority_weight = 1 },
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.abbr = vim_item.abbr:match("[^(]+")
      return vim_item
    end
  }
})

local function deprioritize_snippet(entry1, entry2)
  if entry1:get_kind() == cmp_types.lsp.CompletionItemKind.Snippet then return false end
  if entry2:get_kind() == cmp_types.lsp.CompletionItemKind.Snippet then return true end
end

cmp.setup({
  mapping = cmp_mappings,
  window = {
    completion = cmp.config.window.bordered({
      -- winhighlight = "FloatBorder:Folded"
    }),
    documentation = cmp.config.window.bordered({
      -- winhighlight = "FloatBorder:Folded"
    }),
  },
})

-- cmdline setup.
cmp.setup.cmdline('/', {
  -- mapping = cmp.mapping.preset.cmdline(),
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['k'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['j'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
  },
  sources = { { name = 'buffer' } }
})

-- cmdline setup.
cmp.setup.cmdline(':', {
  -- mapping = cmp.mapping.preset.cmdline(),
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['k'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['j'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
  },
  sources = cmp.config.sources(
    { { name = 'path' } },
    { { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } } }
  )
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

require('lspconfig').pylsp.setup({
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
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
  end,
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

vim.diagnostic.config {
  float = { border = 'single' }
}
