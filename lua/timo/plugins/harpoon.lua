return {
  -- -----------------------------------------------------------------
  --  Harpoon 2 – fast file navigation / bookmarking
  -- -----------------------------------------------------------------
  'ThePrimeagen/harpoon',
  branch = 'harpoon2', -- use the new 2.x branch
  dependencies = { 'nvim-lua/plenary.nvim' },

  -- Load the plugin as soon as any of the defined keys are pressed.
  -- (You could also use `event = "VeryLazy"` if you prefer lazy loading
  --  on startup instead of on keypress.)
  keys = {
    -- Add the current file to Harpoon
    {
      '<leader>a',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Harpoon: Add file to list',
      mode = 'n',
    },

    -- Toggle the quick‑menu (the floating window that shows the list)
    {
      '<C-e>',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Harpoon: Toggle quick menu',
      mode = 'n',
    },

    -- Jump to the first‑four slots (you can add more if you like)
    {
      '<C-h>',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Harpoon: Go to slot 1',
      mode = 'n',
    },
    {
      '<C-t>',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Harpoon: Go to slot 2',
      mode = 'n',
    },
    {
      '<C-n>',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Harpoon: Go to slot 3',
      mode = 'n',
    },
    {
      '<C-s>',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Harpoon: Go to slot 4',
      mode = 'n',
    },

    -- Cycle through the list (prev / next)
    -- NOTE: <C-S-P> / <C-S-N> are not distinguishable from plain <C-p>/<C-n>
    -- on most terminals.  If you really need a “Shifted” version you can use
    -- <C-PageUp>/<C-PageDown> or any other combo you like.
    {
      '<C-p>',
      function()
        require('harpoon'):list():prev()
      end,
      desc = 'Harpoon: Previous entry',
      mode = 'n',
    },
    {
      '<C-n>',
      function()
        require('harpoon'):list():next()
      end,
      desc = 'Harpoon: Next entry',
      mode = 'n',
    },

    -- Alternative “shifted” bindings (uncomment if you prefer them)
    -- { "<C-PageUp>",   function() require("harpoon"):list():prev() end,
    --   desc = "Harpoon: Previous entry (Shifted)", mode = "n" },
    -- { "<C-PageDown>", function() require("harpoon"):list():next() end,
    --   desc = "Harpoon: Next entry (Shifted)", mode = "n" },
  },

  -- -----------------------------------------------------------------
  --  Configuration that runs *after* the plugin is loaded
  -- -----------------------------------------------------------------
  config = function()
    -- The Harpoon 2 API is tiny – a simple `setup()` call is enough.
    -- You can pass a table here if you ever need to customise it.
    require('harpoon').setup()
  end,
}
