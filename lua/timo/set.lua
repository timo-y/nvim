vim.opt.nu = true
vim.opt.relativenumber = true

-- You have to turn this one on :)
vim.opt.inccommand = "split"

-- Best search settings :)
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true

-- Don't have `o` add a comment
vim.opt.formatoptions:remove "o"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.o.mouse = ""

vim.opt.colorcolumn = "80"
vim.cmd([[highlight ColorColumn ctermbg=0 guibg=darkgrey]])

vim.g.mapleader = " "
