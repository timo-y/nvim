-- In-buffer preview for Markdown/HTML/LaTeX/Typst/YAML.
-- https://github.com/OXY2DEV/markview.nvim
--
-- Lazy-loading is not needed: the plugin only does work for its `filetypes`
-- (see `preview.filetypes` below) and already lazy-loads its renderers.
vim.pack.add {
  'https://github.com/OXY2DEV/markview.nvim',
}

local presets = require 'markview.presets'

require('markview').setup {
  preview = {
    -- "internal" | "mini" | "devicons" | "" (none)
    icon_provider = 'internal',

    -- Filetypes to attach to (defaults shown, `yaml` handles frontmatter only)
    filetypes = { 'markdown', 'quarto', 'rmd', 'typst', 'asciidoc' },

    -- Modes in which the buffer stays editable ("n", "i", "v", ...)
    -- Enable with `<Leader>mh` / `:Markview hybridToggle`
    hybrid_modes = {},

    -- `:Markview splitToggle` (side-by-side preview) window options
    splitview_winopts = {
      split = 'right',
      width = 60,
    },

    debounce = 150,
  },

  markdown = {
    headings = presets.headings.glow,
    checkboxes = presets.checkboxes.nerd,
    tables = presets.tables.rounded,
    block_quotes = presets.block_quotes.obsidian,
  },
}

-- No Nerd Font? Swap the line above for:
-- require('markview').setup(require('markview.presets').no_nerd_fonts)

local map = vim.keymap.set

map('n', '<Leader>mt', '<Cmd>Markview toggle<CR>', { desc = 'Markview: Toggle preview (buffer)' })
map('n', '<Leader>mT', '<Cmd>Markview Toggle<CR>', { desc = 'Markview: Toggle preview (global)' })
map('n', '<Leader>mh', '<Cmd>Markview hybridToggle<CR>', { desc = 'Markview: Toggle hybrid mode' })
map('n', '<Leader>ms', '<Cmd>Markview splitToggle<CR>', { desc = 'Markview: Toggle split view' })

-- markview recommends `list=false` (we enable `list` globally for tabs/trailing
-- spaces in `set.lua`, which shows up as noise in rendered markdown).
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.list = false
  end,
})
