local fzf = require('fzf-lua')
fzf.setup({'fzf-native'})

vim.keymap.set({ "n", "v", "i" }, "<leader>pf",
  function() require("fzf-lua").files() end,
  { silent = true, desc = "Open Files search" })
