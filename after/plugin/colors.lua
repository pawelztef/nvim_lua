
function Color(color)
    color = color or 'nord'
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none", fg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none", fg = "none" })
end

vim.g.nord_contrast = false
vim.g.nord_borders = false
vim.g.nord_cursorline_transparent = true
vim.g.nord_enable_sidebar_bakcgroiund = false
vim.g.nord_disable_background = true
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

require('nord').set()

Color()
