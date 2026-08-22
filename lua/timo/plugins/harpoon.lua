-- 1. Install the plugin and its dependency
vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' }, -- pin to the 2.x branch
}

-- 2. Configuration that runs after the plugin is loaded (replaces `config`)
-- The Harpoon 2 API is tiny – a simple `setup()` call is enough.
-- You can pass a table here if you ever need to customise it.
require('harpoon').setup()

-- 3. Keymaps (replaces `keys`)
local map = vim.keymap.set

-- Add the current file to Harpoon
map('n', '<leader>a', function() require('harpoon'):list():add() end, { desc = 'Harpoon: Add file to list' })

-- Toggle the quick-menu (the floating window that shows the list)
map('n', '<C-e>', function()
  local harpoon = require 'harpoon'
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Harpoon: Toggle quick menu' })

-- Jump to the first-four slots (you can add more if you like)
map('n', '<C-t>', function() require('harpoon'):list():select(1) end, { desc = 'Harpoon: Go to slot 1' })

map('n', '<C-n>', function() require('harpoon'):list():select(2) end, { desc = 'Harpoon: Go to slot 2' })

map('n', '<C-s>', function() require('harpoon'):list():select(3) end, { desc = 'Harpoon: Go to slot 3' })

map('n', '<C-y>', function() require('harpoon'):list():select(4) end, { desc = 'Harpoon: Go to slot 4' })

-- Cycle through the list (prev / next)
-- NOTE: <C-S-P> / <C-S-N> are not distinguishable from plain <C-p>/<C-n>
-- on most terminals. If you really need a "Shifted" version you can use
-- <C-PageUp>/<C-PageDown> or any other combo you like.
map('n', '<C-p>', function() require('harpoon'):list():prev() end, { desc = 'Harpoon: Previous entry' })

map('n', '<C-z>', function() require('harpoon'):list():next() end, { desc = 'Harpoon: Next entry' })

-- Alternative "shifted" bindings (uncomment if you prefer them)
-- map('n', '<C-PageUp>', function() require('harpoon'):list():prev() end, { desc = 'Harpoon: Previous entry (Shifted)' })
-- map('n', '<C-PageDown>', function() require('harpoon'):list():next() end, { desc = 'Harpoon: Next entry (Shifted)' })
