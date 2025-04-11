local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "html", "css", "javascript", "typescript" },    -- Add other filetypes as needed
    }),
    null_ls.builtins.formatting.black,
  },
})
