-- This needs to be at top of your `init.lua`
vim.cmd([[
  syntax off
  filetype off
  filetype plugin indent off
]])

require("timo")
vim.opt.shadafile = "NONE" -- remove this, once the shada-file-issue is resolved

-- This needs to be at bottom of your `init.lua`
vim.cmd([[
  syntax on
  filetype on
  filetype plugin indent on
]])
