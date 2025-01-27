function Color(color)
  color = color or 'nord'
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "#668099" })
  vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none", fg = "none" })
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = "none", fg = "green" })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = "none", fg = "red" })
  vim.api.nvim_set_hl(0, "DiffChange", { bg = "none", fg = "orange" })
  vim.api.nvim_set_hl(0, "DiffText", { bg = "none", fg = "yellow" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "none", fg = "#121212" })
  -- new version in neovim
  vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", fg = "#121212" })
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#3B4252", fg = "none" })
  vim.api.nvim_set_hl(0, "Search", { bg = "none", fg = "red" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "#668099" })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none", fg = "#668099" })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none", fg = "#668099" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none", fg = "#668099" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#668099" })
  vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "none", fg = "green" })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "none", fg = "red" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "none", fg = "orange" })
  vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { bg = "none", fg = "gray" })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "none", fg = "gray" })
  vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "none", fg = "gray" })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "none", fg = "red" })
  vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "none", fg = "red" })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "none", fg = "orange" })
  vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "none", fg = "orange" })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "none", fg = "gray" })
  vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = "none", fg = "gray" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1d2633", fg = "white" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "gray", fg = "white" })
  vim.api.nvim_set_hl(0, "AerialNormal", { bg = "none", fg = "red" })
  vim.api.nvim_set_hl(0, "AerialVariable", { bg = "none", fg = "#374457" })
  vim.api.nvim_set_hl(0, "AerialConstant", { bg = "none", fg = "#374457" })
  vim.api.nvim_set_hl(0, "AerialConstantIcon", { bg = "none", fg = "#374457" })
  -- `AerialArray`
  -- `AerialBoolean`
  -- `AerialClass`
  -- `AerialConstant`
  -- `AerialConstructor`
  -- `AerialEnum`
  -- `AerialEnumMember`
  -- `AerialEvent`
  -- `AerialField`
  -- `AerialFile`
  -- `AerialFunction`
  -- `AerialInterface`
  -- `AerialKey`
  -- `AerialMethod`
  -- `AerialModule`
  -- `AerialNamespace`
  -- `AerialNull`
  -- `AerialNumber`
  -- `AerialObject`
  -- `AerialOperator`
  -- `AerialPackage`
  -- `AerialProperty`
  -- `AerialString`
  -- `AerialStruct`
  -- `AerialTypeParameter`
  -- `AerialVariable`
  vim.api.nvim_set_hl(0, "AerialClass", { bg = "none", fg = "#60a1e3" })
  vim.api.nvim_set_hl(0, "AerialClassIcon", { bg = "none", fg = "#60a1e3" })
  vim.api.nvim_set_hl(0, "AerialVariableIcon", { bg = "none", fg = "#374457" })
  vim.api.nvim_set_hl(0, "AerialLine", { bg = "#1d242e", fg = "none" })
  vim.api.nvim_set_hl(0, "AerialLineNC", { bg = "#1d242e", fg = "none" })
  vim.api.nvim_set_hl(0, "Cursorline", { bg = "none", fg = "red" })
  vim.api.nvim_set_hl(0, "BookmarkSign", { bg = "none", fg = "red" })

  vim.api.nvim_set_hl(0, "NeogitDiffHeader", { bg = "none", fg = "#81a1c1" })
  vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "none", fg = "#9d5057" })
  vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = "none", fg = "#869c73" })
  vim.api.nvim_set_hl(0, "NeogitCommitViewHeader", { bg = "none", fg = "#22252a" })
  vim.api.nvim_set_hl(0, "NeogitDiffHeaderHighlight", { bg = "none", fg = "#ebcb8b" })
  vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", { bg = "none", fg = "#88c0d0" })
  vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { bg = "none", fg = "#bf616a" })
  vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { bg = "none", fg = "#a3be8c" })
  vim.api.nvim_set_hl(0, "DiffviewStatusLine", { bg = "none", fg = "none" })
  vim.api.nvim_set_hl(0, "DiffviewStatusLineNC", { bg = "none", fg = "none" })
  vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "none", fg = "#bf616a" })
  -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "none" })
  -- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = "none" })
  -- vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = "none", fg = "#d8dee9" })
  -- vim.api.nvim_set_hl(0, "StatusLineTermNC", { bg = "none", fg = "#d8dee9" })
  -- vim.api.nvim_set_hl(0, "DiffviewStatusLine", { bg = "none", fg = "none" })
  -- vim.api.nvim_set_hl(0, "DiffviewStatusLineNC", { bg = "none", fg = "none" })
  -- vim.api.nvim_set_hl(0, "StatusLineDull", { bg = "none", fg = "#4c566a" })
  -- vim.api.nvim_set_hl(0, "CursorColumn", { bg = "none", fg = "none" })
  vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { bg = "none", fg = "none" })
  vim.api.nvim_set_hl(0, "NeogitDiffContext", { bg = "none", fg = "none" })
  vim.api.nvim_set_hl(0, "NeogitCursorLine", { bg = "none", fg = "none" })
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

require('nord').set()

vim.g.onedark_color_overrides = {
  background = { gui = "#2F343F", cterm = "235", cterm16 = "0" },
}


Color()

local function setup()
  Color()
  vim.api.nvim_set_hl(0, "Red", { bg = "none", fg = "red" })
  vim.api.nvim_set_hl(0, "Yellow", { bg = "none", fg = "yellow" })
  vim.api.nvim_set_hl(0, "Orange", { bg = "none", fg = "orange" })
  vim.api.nvim_set_hl(0, "NordRed", { bg = "none", fg = "#b18baa" })
  vim.api.nvim_set_hl(0, "NordYellow", { bg = "none", fg = "#EBCB8B" })
  vim.api.nvim_set_hl(0, "NordOrange", { bg = "none", fg = "#D08770" })
  vim.api.nvim_set_hl(0, "SaturatedRed", { bg = "none", fg = "#FF5F5F" })
  vim.api.nvim_set_hl(0, "SaturatedYellow", { bg = "none", fg = "#FFD700" })
  vim.api.nvim_set_hl(0, "SaturatedOrange", { bg = "none", fg = "#FF8C00" })

  local function color_tags()
    vim.fn.matchadd('Red', 'breakpoint[^%)]*)')
    vim.fn.matchadd('SaturatedYellow', '\\ NOTE\\.*')
    vim.fn.matchadd('SaturatedYellow', '\\ TODO\\.*')
    vim.fn.matchadd('SaturatedYellow', '\\ ISSUE\\.*')
    vim.fn.matchadd('SaturatedRed', '\\ WARNING\\.*')
    vim.fn.matchadd('SaturatedOrange', '\\ MARK\\.*')
    vim.fn.matchadd('NordRed', '@classmethod')
    vim.fn.matchadd('NordRed', '@pytest[^%(]*')
    vim.fn.matchadd('NordRed', '@mock[^%(]*')
    vim.fn.matchadd('NordRed', '@patch[^%(]*')
    vim.fn.matchadd('NordRed', '@parameterized[^%(]*')
  end
  vim.api.nvim_create_autocmd(
    { "WinEnter", "BufRead" },
    { callback = color_tags }
  )
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*", -- Apply to all colorschemes
    callback = function()
      vim.api.nvim_set_hl(0, "Normal", { bg = 'none', fg = 'red' })
    end
  })
end
vim.defer_fn(setup, 0)
