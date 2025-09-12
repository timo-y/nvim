-- ~/.config/nvim/lua/plugins/rose-pine.lua
-- --------------------------------------------------------------
--  Rose‑Pine colorscheme – with your custom palette & highlights
-- --------------------------------------------------------------
return {
  'rose-pine/neovim',
  name = 'rose-pine', -- optional, useful for :colorscheme
  lazy = false, -- load at startup (you probably want the theme early)
  priority = 1000, -- ensure it loads before other plugins that set highlights

  -- -----------------------------------------------------------------
  --  Options passed to `require('rose-pine').setup()`
  -- -----------------------------------------------------------------
  opts = {
    --- @usage 'auto'|'main'|'moon'|'dawn'
    variant = 'auto',
    --- @usage 'main'|'moon'|'dawn'
    dark_variant = 'main',
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = false,
    disable_float_background = false,
    disable_italics = true,

    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
      background = 'base',
      background_nc = '_experimental_nc',
      panel = 'surface',
      panel_nc = 'base',
      border = 'highlight_med',
      comment = 'muted',
      link = 'iris',
      punctuation = 'subtle',
      error = 'love',
      hint = 'iris',
      info = 'foam',
      warn = 'gold',

      headings = {
        h1 = 'iris',
        h2 = 'foam',
        h3 = 'rose',
        h4 = 'gold',
        h5 = 'pine',
        h6 = 'foam',
      },
      -- If you prefer to set *all* headings at once you could replace the whole
      -- table above with:  headings = "subtle",
    },

    -- -----------------------------------------------------------------
    --  Highlight‑group overrides (see the wiki for more recipes)
    -- -----------------------------------------------------------------
    highlight_groups = {
      ColorColumn = { bg = 'rose' },
      CursorLine = { bg = 'foam', blend = 10 }, -- blend = 0‑100 (percentage)
      StatusLine = { fg = 'love', bg = 'love', blend = 10 },
      Search = { bg = 'gold', inherit = false }, -- inherit = false makes this exact
    },
  },

  -- -----------------------------------------------------------------
  --  `config` runs **after** the plugin (and its optional deps) are loaded.
  --  It calls `setup(opts)` and then activates the colorscheme.
  -- -----------------------------------------------------------------
  config = function(_, opts)
    -- Apply the palette / highlight customisations
    require('rose-pine').setup(opts)

    -- Finally tell Neovim to use the theme
    vim.cmd 'colorscheme rose-pine'
  end,
}
