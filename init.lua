-- Enable Neovim's built-in module caching (Neovim 0.9+)
if vim.loader then
    vim.loader.enable()
end

require("timo")

vim.opt.shadafile = "NONE" -- Temporary workaround, remove when resolved
