-- ~/.config/nvim/lua/plugins/refactoring.lua
-- --------------------------------------------------------------
--  refactoring.nvim – code‑refactor actions powered by treesitter
-- --------------------------------------------------------------
return {
  'ThePrimeagen/refactoring.nvim',

  -- Load the plugin eagerly (you can change this to true + an event if you
  -- prefer true lazy‑loading).
  lazy = false,

  -- -----------------------------------------------------------------
  --  Dependencies
  -- -----------------------------------------------------------------
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },

  -- -----------------------------------------------------------------
  --  Options that will be passed to `require("refactoring").setup()`
  -- -----------------------------------------------------------------
  opts = {}, -- keep empty for the defaults; you can add custom
  -- configuration later (see :help refactoring.setup)

  -- -----------------------------------------------------------------
  --  Keymaps – these are the exact mappings you wrote.
  --  We add them in the `config` function so they are defined **after**
  --  the plugin has been loaded.
  -- -----------------------------------------------------------------
  config = function(_, opts)
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
  end,
}
