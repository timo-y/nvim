-- 1. Install the plugin
vim.pack.add {
  'https://github.com/LudoPinelli/comment-box.nvim',
}

-- 2. Configure it (replaces `config = function() ... end`)
require('comment-box').setup {
  -- box_width = 80,        -- default width
  -- highlight = "Comment", -- highlight group for the border
}

-- 3. Keymaps (replaces `keys`)
local map = vim.keymap.set

map({ 'n', 'v' }, '<Leader>cb', '<Cmd>CBccbox<CR>', { desc = 'Comment-box: Create box' })
map({ 'n', 'v' }, '<Leader>ct', '<Cmd>CBllline<CR>', { desc = 'Comment-box: Named part' })
map('n', '<Leader>cl', '<Cmd>CBline<CR>', { desc = 'Comment-box: Simple line' })
-- Uncomment the line below if you also want the insert-mode shortcut
-- map('i', '<M-l>', '<Cmd>CBline<CR>', { desc = 'Comment-box: Insert line' })
map({ 'n', 'v' }, '<Leader>cm', '<Cmd>CBllbox14<CR>', { desc = 'Comment-box: Marked comment' })
-- Optional: quick delete of the current box
map({ 'n', 'v' }, '<Leader>cd', '<Cmd>CBd<CR>', { desc = 'Comment-box: Delete box' })
