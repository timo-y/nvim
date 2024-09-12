local statusline = require('statusline')
statusline.tabline = false
-- NOTE: Nvim Native LSP is displayed default
-- I personally prefer ALE, with nathunsmitty/nvim-ale-diagnostic piping LSP diags
-- With ALE you can get errors displayed without explicitly needing an LSP server
statusline.lsp_diagnostics = true
statusline.ale_diagnostics = true
-- This setting will mean that you have one single statusline drawn accross the entire display
vim.o.laststatus = 3
