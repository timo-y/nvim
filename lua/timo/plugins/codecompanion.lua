return {
  'olimorris/codecompanion.nvim',
  version = '17.33.0',
  cmd = {
    'CodeCompanion',
    'CodeCompanionChat',
    'CodeCompanionActions',
    'CodeCompanionToggle',
  },
  keys = {
    { '<leader>cc', '<cmd>CodeCompanionChat<cr>', mode = { 'n', 'v' }, desc = 'Code Companion Chat' },
    { '<leader>ca', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, desc = 'Code Companion Actions' },
  },
  opts = {},
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      'saghen/blink.cmp',
      lazy = false, -- Keep this false since blink.cmp needs to be available for all completion
      version = '*',
      opts = {
        keymap = {
          preset = 'enter',
          ['<S-Tab>'] = { 'select_prev', 'fallback' },
          ['<Tab>'] = { 'select_next', 'fallback' },
        },
        cmdline = { sources = { 'cmdline' } },
        sources = {
          default = { 'lsp', 'path', 'buffer', 'codecompanion' },
        },
      },
    },
  },
}
