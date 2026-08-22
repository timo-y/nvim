vim.pack.add {
  'https://github.com/lewis6991/async.nvim',
  'https://github.com/theprimeagen/refactoring.nvim',
}
-- Run the plugin's setup with the options from the spec
require('refactoring').setup(opts)

-- Visual‑mode (x) mappings
vim.keymap.set('x', '<leader>re', ':Refactor extract<CR>', { desc = 'Extract selection to a new function' })
vim.keymap.set('x', '<leader>rf', ':Refactor extract_to_file<CR>', { desc = 'Extract selection to a new file' })
vim.keymap.set('x', '<leader>rv', ':Refactor extract_var<CR>', { desc = 'Extract selection to a new variable' })
vim.keymap.set({ 'n', 'x' }, '<leader>ri', ':Refactor inline_var<CR>', { desc = 'Inline variable' })

-- Normal‑mode mappings
vim.keymap.set('n', '<leader>rI', ':Refactor inline_func<CR>', { desc = 'Inline function' })
vim.keymap.set('n', '<leader>rb', ':Refactor extract_block<CR>', { desc = 'Extract block' })
vim.keymap.set('n', '<leader>rbf', ':Refactor extract_block_to_file<CR>', { desc = 'Extract block to file' })
vim.keymap.set('n', '<leader>ri', ':Refactor inline_var<CR>', { desc = 'Inline variable (normal mode)' })

-- calling `require("refactoring").setup()` is not required for the plugin to work
