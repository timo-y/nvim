local function gh(repo) return 'https://github.com/' .. repo end

-- [[ mini.nvim ]]
--  A collection of various small independent plugins/modules
vim.pack.add { gh 'nvim-mini/mini.nvim' }

-- If a nerd font is available, load the icons module for pretty icons in various plugins.
if vim.g.have_nerd_font then
  require('mini.icons').setup()
  -- Used for backwards compatibility with plugins that require `nvim-web-devicons` (e.g. telescope.nvim)
  MiniIcons.mock_nvim_web_devicons()
end

-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yiiq - [Y]ank [I]nside [I]+1 [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require('mini.ai').setup {
  -- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
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

-- Simple and easy statusline.
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
local statusline = require 'mini.statusline'
-- Set `use_icons` to true if you have a Nerd Font
statusline.setup { use_icons = vim.g.have_nerd_font,
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
-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function() return '%2l:%-2v' end

-- ... and there is more!
--  Check out: https://github.com/nvim-mini/mini.nvim

-- vim: ts=2 sts=2 sw=2 et
