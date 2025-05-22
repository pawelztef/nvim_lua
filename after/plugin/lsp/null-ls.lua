local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "html", "css", "javascript", "typescript" }, -- Add other filetypes as needed
      extra_args = { "--print-width", "120", "--prose-wrap", "never" }, -- Set line length to 120, do not linebreak parameters
    }),
  },
})
