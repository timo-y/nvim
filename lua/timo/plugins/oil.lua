-- ~/.config/nvim/lua/plugins/oil.lua
-- --------------------------------------------------------------
--  oil.nvim – a nice “file‑explorer‑as‑a‑buffer” replacement
-- --------------------------------------------------------------
return {
  'stevearc/oil.nvim',
  -- The table that will be passed to `require("oil").setup()`.
  -- You can keep the whole thing exactly as you wrote it.
  opts = {
    -----------------------------------------------------------------
    --  General behaviour
    -----------------------------------------------------------------
    default_file_explorer = true, -- take over `vim .`, `:e src/`, …
    columns = { 'icon' }, -- you can enable "size", "mtime", …
    buf_options = {
      buflisted = false,
      bufhidden = 'hide',
    },
    win_options = {
      wrap = false,
      signcolumn = 'no',
      cursorcolumn = false,
      foldcolumn = '0',
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = 'nvic',
    },

    -----------------------------------------------------------------
    --  Deleting / trash
    -----------------------------------------------------------------
    delete_to_trash = true,
    skip_confirm_for_simple_edits = false,
    prompt_save_on_select_new_entry = true,
    cleanup_delay_ms = 2000,

    -----------------------------------------------------------------
    --  LSP integration
    -----------------------------------------------------------------
    lsp_file_methods = {
      enabled = true,
      timeout_ms = 1000,
      autosave_changes = false,
    },

    -----------------------------------------------------------------
    --  Cursor / watcher
    -----------------------------------------------------------------
    constrain_cursor = 'editable',
    watch_for_changes = false,

    -----------------------------------------------------------------
    --  Keymaps (you already disabled the defaults)
    -----------------------------------------------------------------
    use_default_keymaps = false,
    keymaps = {
      ['g?'] = 'actions.show_help',
      ['<CR>'] = 'actions.select',
      ['<leader>vv'] = { 'actions.select', opts = { vertical = true }, desc = 'Open in vertical split' },
      ['<leader>h'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open in horizontal split' },
      ['<leader>t'] = { 'actions.select', opts = { tab = true }, desc = 'Open in new tab' },
      ['<C-p>'] = 'actions.preview',
      ['<C-c>'] = 'actions.close',
      ['<C-l>'] = 'actions.refresh',
      ['-'] = 'actions.parent',
      ['_'] = 'actions.open_cwd',
      ['`'] = 'actions.cd',
      ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory' },
      ['gs'] = 'actions.change_sort',
      ['gx'] = 'actions.open_external',
      ['g.'] = 'actions.toggle_hidden',
      ['g\\'] = 'actions.toggle_trash',
    },

    -----------------------------------------------------------------
    --  View options
    -----------------------------------------------------------------
    view_options = {
      show_hidden = true,
      is_hidden_file = function(name, _bufnr)
        return vim.startswith(name, '.')
      end,
      is_always_hidden = function(_, _)
        return false
      end,
      natural_order = true,
      case_insensitive = false,
      sort = {
        { 'type', 'asc' },
        { 'name', 'asc' },
      },
    },

    -----------------------------------------------------------------
    --  Miscellaneous helpers
    -----------------------------------------------------------------
    extra_scp_args = {},
    git = {
      add = function(_)
        return false
      end,
      mv = function(_, _)
        return false
      end,
      rm = function(_)
        return false
      end,
    },

    -----------------------------------------------------------------
    --  Floating‑window configuration
    -----------------------------------------------------------------
    float = {
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = 'rounded',
      win_options = { winblend = 0 },
      preview_split = 'right',
      override = function(conf)
        return conf
      end,
    },

    preview = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      max_height = 0.9,
      min_height = { 5, 0.1 },
      border = 'rounded',
      win_options = { winblend = 0 },
      update_on_cursor_moved = true,
    },

    progress = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      max_height = { 10, 0.9 },
      min_height = { 5, 0.1 },
      border = 'rounded',
      minimized_border = 'none',
      win_options = { winblend = 0 },
    },

    ssh = { border = 'rounded' },
    keymaps_help = { border = 'rounded' },
  },

  -----------------------------------------------------------------
  --  Optional dependency – mini.icons (tiny, pure‑Lua icons)
  -----------------------------------------------------------------
  dependencies = {
    { 'echasnovski/mini.icons', opts = {} },
    -- If you prefer the classic devicons you can replace the line above with:
    -- "nvim-tree/nvim-web-devicons",
  },

  -----------------------------------------------------------------
  --  Load as soon as possible (oil needs to be available for `vim .`)
  -----------------------------------------------------------------
  lazy = false, -- set to true + an event if you want true lazy‑load
}
