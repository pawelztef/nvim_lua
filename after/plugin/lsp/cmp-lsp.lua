local cmp = require('cmp')
local cmp_types = require("cmp.types")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered({
      -- winhighlight = "FloatBorder:Folded"
    }),
    documentation = cmp.config.window.bordered({
      -- winhighlight = "FloatBorder:Folded"
    }),
  },
  mapping = cmp.mapping.preset.insert({
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
    -- ['<C-CR>'] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), { 'i', 'c' }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(cmp_select), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(cmp_select), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})

require('cmp').setup({
  mapping = cmp.mapping.preset.insert({
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
    -- ['<C-CR>'] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), { 'i', 'c' }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(cmp_select), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(cmp_select), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
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

-- local function deprioritize_snippet(entry1, entry2)
--   if entry1:get_kind() == cmp_types.lsp.CompletionItemKind.Snippet then return false end
--   if entry2:get_kind() == cmp_types.lsp.CompletionItemKind.Snippet then return true end
-- end


-- cmdline setup.
cmp.setup.cmdline('/', {
  -- mapping = cmp.mapping.preset.cmdline(),
  mapping = {
    ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
    ['k'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['j'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    -- ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(cmp_select), { 'i', 'c' }),
    -- ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(cmp_select), { 'i', 'c' }),
  },
  sources = { { name = 'buffer' } }
})

-- cmdline setup.
cmp.setup.cmdline(':', {
  -- mapping = cmp.mapping.preset.cmdline(),
  mapping = {
    -- generates unnecesary confirm strokes
    ['<C-CR>'] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), { 'i', 'c' }),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['k'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['j'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
  },
  sources = cmp.config.sources(
    { { name = 'path' } },
    { { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } } }
  )
})
