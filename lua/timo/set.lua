vim.opt.nu = true
vim.opt.relativenumber = true
-- Show which line your cursor is on
vim.o.cursorline = true

-- You have to turn this one on :)
vim.opt.inccommand = 'split'
-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Best search settings :)
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.linebreak = false
-- Enable break indent (if above is true and there are broken lines)
vim.o.breakindent = true

-- Don't have `o` add a comment
vim.opt.formatoptions:remove 'o'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand '~/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.mouse = 'a'

vim.opt.colorcolumn = '80'
vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#262836]]

-- whitespace handling
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.g.mapleader = ' '

-- vim: ts=2 sts=2 sw=2 et
