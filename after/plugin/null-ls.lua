local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

null_ls.setup {
    debug = false,
    sources = {
        formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
        formatting.black.with { extra_args = { "--fast" } },
        formatting.isort,
        formatting.stylua,
        formatting.json_tool,
        formatting.nginx_beautifier,
        formatting.sqlformat,
        formatting.phpcbf,
        formatting.yamlfmt,
    },
}
