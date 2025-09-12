-- --------------------------------------------------------------
--  Mini.nvim – a collection of tiny, focused modules.
--  This file registers the plugin and configures every
--  sub‑module you asked for.
-- --------------------------------------------------------------

return {
  -- The main repository – we pull the whole collection.
  'echasnovski/mini.nvim',
  version = '*', -- always get the latest stable tag
  -- Load the plugin as soon as Neovim starts (VeryLazy) or when any
  -- of the modules is first used.  Feel free to change to `"event = "BufRead"` etc.
  lazy = false, -- set to true if you want true lazy‑load
  -- If you *do* want lazy loading, you can use:
  -- event = "VeryLazy",

  -- ------------------------------------------------------------
  --  Configuration that runs after the plugin is loaded.
  -- ------------------------------------------------------------
  config = function()
    -----------------------------------------------------------------
    --  Icons (used by other mini modules)
    -----------------------------------------------------------------
    require('mini.icons').setup()

    -----------------------------------------------------------------
    --  AI – text objects, selections, etc.
    -----------------------------------------------------------------
    require('mini.ai').setup()

    -----------------------------------------------------------------
    --  Surround – custom mappings using the “ü” prefix
    -----------------------------------------------------------------
    require('mini.surround').setup {
      mappings = {
        add = 'üa', -- Add surrounding (Normal & Visual)
        delete = 'üd', -- Delete surrounding
        find = 'üf', -- Find surrounding to the right
        find_left = 'üF', -- Find surrounding to the left
        highlight = 'üh', -- Highlight surrounding
        replace = 'ür', -- Replace surrounding
        update_n_lines = 'ün', -- Update `n_lines`
      },
    }

    -----------------------------------------------------------------
    --  Comment – toggles comments for the current line/selection
    -----------------------------------------------------------------
    require('mini.comment').setup()

    -----------------------------------------------------------------
    --  Statusline – custom layout you already wrote
    -----------------------------------------------------------------
    require('mini.statusline').setup {
      content = {
        active = function()
          local s = require 'mini.statusline'
          local mode, mode_hl = s.section_mode { trunc_width = 120 }
          local filename = s.section_filename { trunc_width = 140 }
          local fileinfo = s.section_fileinfo { trunc_width = 120 }
          local location = s.section_location { trunc_width = 75 }
          return s.combine_groups {
            { hl = mode_hl, strings = { mode } },
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=',
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = mode_hl, strings = { location } },
          }
        end,
      },
    }

    -----------------------------------------------------------------
    --  Tabline – simple default setup
    -----------------------------------------------------------------
    require('mini.tabline').setup()

    -----------------------------------------------------------------
    --  Diff – visual diff of the current buffer vs. saved file
    -----------------------------------------------------------------
    local diff = require 'mini.diff'
    diff.setup {
      -- Disabled by default
      source = diff.gen_source.none(),
    }

    -----------------------------------------------------------------
    --  IndentScope – optional, but many people like it.
    --  The block is commented out in your original snippet; you can
    --  enable it by removing the surrounding `--[[ ... ]]` comment.
    -----------------------------------------------------------------
    -- require('mini.indentscope').setup {
    --   draw = {
    --     -- Disable the animated “smooth” drawing (keeps it crisp and fast)
    --     animation = require('mini.indentscope').gen_animation.none(),
    --   },
    -- }
  end,
}
