vim.opt.number = true
vim.opt.syntax = on 
vim.opt.hlsearch = false 
vim.opt.wrap = false 
vim.opt.hidden = true                                      -- required to keep multiple buffers
vim.opt.encoding = 'utf-8'                                 --  encoding written to file
vim.opt.pumheight = 10                                     --  smaller pop menue
vim.opt.cmdheight = 1                                      --  height of displayed messages
vim.opt.updatetime = 50                                    --  faster completion
vim.opt.signcolumn = 'yes' 
vim.opt.synmaxcol = 128
vim.opt.lazyredraw = true
vim.opt.scrolloff = 25
vim.opt.autoread = true
vim.opt.mouse = 'a'                                          -- enable mouse
vim.opt.ruler = true                                       -- show cursor position
vim.opt.linebreak = true
vim.opt.expandtab = true                                   -- converts tabs to spaces
vim.opt.shiftwidth = 2
vim.opt.readonly = false
vim.opt.swapfile = false
vim.opt.termguicolors = false
vim.opt.cursorline = false
vim.opt.viewoptions = {'cursor', 'folds', 'slash', 'unix'} -- view save for for folds
vim.opt.splitbelow = true                                  -- horizontal split
vim.opt.splitright = true                                  -- vertical split
vim.opt.clipboard = 'unnamed'
vim.opt.timeout = true
vim.opt.timeoutlen = 400
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100
vim.opt.ttimeoutlen = 100
vim.opt.incsearch = true
vim.opt.colorcolumn = "3000"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undo-dir"
vim.opt.undofile = true




vim.g.mapleader = " "


-- filetype plugin indent on
-- au CursorHold * checktime
-- colorscheme nord 

-- autocmd BufRead,BufNewFile *.md setlocal spell
--[[
-- Let's save undo info!
if !isdirectory($HOME."/.config/nvim")                       
  call mkdir($HOME.".config/nvim", "", 0770)
endif
-- lets set undofile
if !isdirectory($HOME."/.config/nvim/undo-dir") 
  call mkdir($HOME."/.config/nvim/undo-dir", "", 0700)
endif

set undodir=~/.nvim/undo-dir

" au BufNewFile,BufRead *.js, *.html, *.css, *.rb
"     \ set tabstop=2 |
"     \ set softtabstop=2 |
"     \ set shiftwidth=2 |
]]--