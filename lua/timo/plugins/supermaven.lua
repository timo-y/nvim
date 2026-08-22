-- 1. Install the plugin
vim.pack.add {
  'https://github.com/supermaven-inc/supermaven-nvim',
}

-- 2. Configure it (replaces `config = function() ... end`)
require('supermaven-nvim').setup {
  keymaps = {
    accept_suggestion = '<C-x>',
    clear_suggestion = '<C-]>',
    accept_word = '<C-l>',
  },
}

-- 3. Keymaps (replaces `keys`)
vim.keymap.set('n', '<leader>tS', function() vim.cmd 'SupermavenToggle' end, { desc = 'Toggle Supermaven' })
