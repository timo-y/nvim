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
    tables = presets.tables.rounded,
    block_quotes = presets.block_quotes.obsidian,
  },

  -- NOTE: checkboxes live under `markdown_inline`, not `markdown`.
  markdown_inline = {
    checkboxes = presets.checkboxes.nerd,
  },

  -- `[ ]` / `[x]` only count as checkboxes when they directly follow a list
  -- marker (`- [ ]`). Anywhere else (`- Foo: [ ] a, [x] b`) markview parses
  -- them as a "shortcut link" and renders a link icon. This custom renderer
  -- draws the configured checkbox glyph instead.
  renderers = {
    inline_link_shortcut = function(ns, buffer, item)
      local label = item.label or (item.text and item.text[1]:match '^%[(.-)%]$') or ''
      local range = item.range
      local checkbox = require('markview.spec').get({ 'markdown_inline', 'checkboxes' }, { fallback = nil })

      local opts
      if label == ' ' then
        opts = checkbox and checkbox.unchecked
      elseif label == 'x' or label == 'X' then
        opts = checkbox and checkbox.checked
      elseif checkbox then
        opts = checkbox[label]
      end

      if not opts or range.row_start ~= range.row_end then
        -- Not checkbox-like, or multi-line: keep default link rendering.
        return require('markview.renderers.markdown_inline').link_shortcut(buffer, item)
      end

      vim.api.nvim_buf_set_extmark(buffer, ns, range.row_start, range.col_start, {
        undo_restore = false,
        invalidate = true,
        end_row = range.row_end,
        end_col = range.col_end,
        conceal = '',
        virt_text_pos = 'inline',
        virt_text = { { opts.text, opts.hl } },
      })
    end,
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
