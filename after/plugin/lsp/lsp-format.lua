require("lsp-format").setup({})
require("lspconfig").buf.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").jsonls.setup { on_attach = require("lsp-format").on_attach }
-- require("lspconfig").html.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").pyright.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").cssls.setup { on_attach = require("lsp-format").on_attach }
