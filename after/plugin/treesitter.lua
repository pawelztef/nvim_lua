require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "help", "javascript", "typescript", "python", "lua", "ruby", "php", "html", "css" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
        enable = true,
        disable = { "c", "rust" },
    },
    indent = { enable = true },
    autotag = {
        enable = true,
    }
}
