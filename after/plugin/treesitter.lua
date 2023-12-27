require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "help", "javascript", "typescript", "python", "lua", "ruby", "php", "html", "css", "json", "yaml",
    "toml", "bash", "dockerfile", "go", "rust", "java", "regex", "vim", "lua" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  }
}
