-- Create an autocommand group to avoid duplicate autocommands
local format_on_save = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

-- Set up the autocommand
vim.api.nvim_create_autocmd("BufWritePre", {
  group = format_on_save,
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
