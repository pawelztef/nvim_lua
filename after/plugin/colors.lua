function Color(color)
    color = color or 'nord'
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none", fg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none", fg = "none" })
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "none", fg = "green" })
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = "none", fg = "red" })
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "none", fg = "orange" })
    vim.api.nvim_set_hl(0, "DiffText", { bg = "none", fg = "yellow" })
    vim.api.nvim_set_hl(0, "VertSplit", { bg = "none", fg = "#121212" })
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#3B4252", fg = "none" })
    vim.api.nvim_set_hl(0, "Search", { bg = "none", fg = "red" })

end

vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_cursorline_transparent = true
vim.g.nord_enable_sidebar_bakcgroiund = false
vim.g.nord_disable_background = true
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

vim.opt.fillchars = { eob = ' ' } -- overriding fillchars with empty space

vim.api.nvim_set_hl(0, "Red", { bg = "none", fg = "red" })

local function color_tags()
    vim.fn.matchadd('Red', 'breakpoint()')
    vim.fn.matchadd('Red', '@pytest.mark.skip()')
    vim.fn.matchadd('yellow', 'NOTE')
    vim.fn.matchadd('yellow', 'TODO')
    vim.fn.matchadd('yellow', 'ISSUE')
    vim.fn.matchadd('red', 'WARNING')
    vim.fn.matchadd('red', 'Warning')
end

vim.api.nvim_create_autocmd(
    { "WinEnter", "BufRead" },
    { callback = color_tags }
)

vim.api.nvim_create_autocmd({ "WinEnter", "BufRead" }, {
    pattern = { "breakpoint()", "WARNING" },
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = 'none', fg = 'red' })
    end
})

require('nord').set()

vim.g.onedark_color_overrides = {
    background = { gui = "#2F343F", cterm = "235", cterm16 = "0" },
}

Color()
