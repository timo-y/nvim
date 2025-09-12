return {
  'LudoPinelli/comment-box.nvim',
  -- Load it on any of the keys you’ll use – this makes the plugin lazy‑loaded
  keys = {
    { '<Leader>cb', '<Cmd>CBccbox<CR>', mode = { 'n', 'v' }, desc = 'Comment‑box: Create box' },
    { '<Leader>ct', '<Cmd>CBllline<CR>', mode = { 'n', 'v' }, desc = 'Comment‑box: Named part' },
    { '<Leader>cl', '<Cmd>CBline<CR>', mode = 'n', desc = 'Comment‑box: Simple line' },
    -- Uncomment the line below if you also want the insert‑mode shortcut
    -- { "<M-l>",       "<Cmd>CBline<CR>",      mode = "i",          desc = "Comment‑box: Insert line" },
    { '<Leader>cm', '<Cmd>CBllbox14<CR>', mode = { 'n', 'v' }, desc = 'Comment‑box: Marked comment' },
    -- Optional: quick delete of the current box
    { '<Leader>cd', '<Cmd>CBd<CR>', mode = { 'n', 'v' }, desc = 'Comment‑box: Delete box' },
  },

  -- If you need to tweak the plugin itself you can do it here.
  -- The plugin ships with its own defaults, so we only call `setup()` when
  -- you have custom options.
  config = function()
    -- Example of custom plugin options (feel free to delete if you don’t need them)
    require('comment-box').setup {
      -- box_width = 80,        -- default width
      -- highlight = "Comment", -- highlight group for the border
    }
  end,
}
