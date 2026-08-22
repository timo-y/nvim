-- 1. Install the plugin
vim.pack.add {
  'https://github.com/folke/snacks.nvim',
}

-- 2. Configure it (replaces `opts`)
require('snacks').setup {
  bigfile = { enabled = true },
  indent = {
    enabled = true,
    animate = { enabled = false },
    indent = { enabled = true },
    scope = { enabled = true },
    chunk = { enabled = false },
  },
  input = { enabled = true },
  picker = {
    enabled = true,
    main = { file = false },
  },
  quickfile = { enabled = true },
  words = { enabled = true },
  terminal = {
    enabled = true,
  },
}

-- 3. Keymaps (replaces `keys`)
local map = vim.keymap.set

-- Top Pickers & Explorer
map('n', '<leader>pf', function() Snacks.picker.smart() end, { desc = 'Smart Find Files' })
map('n', '<leader>n', function() Snacks.picker.notifications() end, { desc = 'Notification History' })

-- find
map('n', '<leader>fb', function() Snacks.picker.buffers() end, { desc = 'Buffers' })
map('n', '<leader>fc', function() Snacks.picker.files { cwd = vim.fn.stdpath 'config' } end, { desc = 'Find Config File' })
map('n', '<leader>ff', function() Snacks.picker.files() end, { desc = 'Find Files' })
map('n', '<leader>fg', function() Snacks.picker.git_files() end, { desc = 'Find Git Files' })
map('n', '<leader>fp', function() Snacks.picker.projects() end, { desc = 'Projects' })
map('n', '<leader>fr', function() Snacks.picker.recent() end, { desc = 'Recent' })

-- git
map('n', '<leader>gb', function() Snacks.picker.git_branches() end, { desc = 'Git Branches' })
map('n', '<leader>gl', function() Snacks.picker.git_log() end, { desc = 'Git Log' })
map('n', '<leader>gL', function() Snacks.picker.git_log_line() end, { desc = 'Git Log Line' })
map('n', '<leader>gs', function() Snacks.picker.git_status() end, { desc = 'Git Status' })
map('n', '<leader>gS', function() Snacks.picker.git_stash() end, { desc = 'Git Stash' })
map('n', '<leader>gd', function() Snacks.picker.git_diff() end, { desc = 'Git Diff (Hunks)' })
map('n', '<leader>gf', function() Snacks.picker.git_log_file() end, { desc = 'Git Log File' })

-- Grep
map('n', '<leader>ls', function() Snacks.picker.lines() end, { desc = 'Buffer Lines' })
map('n', '<leader>bs', function() Snacks.picker.grep_buffers() end, { desc = 'Grep Open Buffers' })
map('n', '<leader>ps', function() Snacks.picker.grep() end, { desc = 'Grep' })
map({ 'n', 'x' }, '<leader>fw', function() Snacks.picker.grep_word() end, { desc = 'Visual selection or word' })

-- search
map('n', '<leader>s/', function() Snacks.picker.search_history() end, { desc = 'Search History' })
map('n', '<leader>sa', function() Snacks.picker.autocmds() end, { desc = 'Autocmds' })
map('n', '<leader>sb', function() Snacks.picker.lines() end, { desc = 'Buffer Lines' })
map('n', '<leader>sc', function() Snacks.picker.command_history() end, { desc = 'Command History' })
map('n', '<leader>sC', function() Snacks.picker.commands() end, { desc = 'Commands' })
map('n', '<leader>sd', function() Snacks.picker.diagnostics() end, { desc = 'Diagnostics' })
map('n', '<leader>sD', function() Snacks.picker.diagnostics_buffer() end, { desc = 'Buffer Diagnostics' })
map('n', '<leader>sh', function() Snacks.picker.help() end, { desc = 'Help Pages' })
map('n', '<leader>sH', function() Snacks.picker.highlights() end, { desc = 'Highlights' })
map('n', '<leader>si', function() Snacks.picker.icons() end, { desc = 'Icons' })
map('n', '<leader>sj', function() Snacks.picker.jumps() end, { desc = 'Jumps' })
map('n', '<leader>sk', function() Snacks.picker.keymaps() end, { desc = 'Keymaps' })
map('n', '<leader>sl', function() Snacks.picker.loclist() end, { desc = 'Location List' })
map('n', '<leader>sm', function() Snacks.picker.marks() end, { desc = 'Marks' })
map('n', '<leader>sM', function() Snacks.picker.man() end, { desc = 'Man Pages' })
map('n', '<leader>sp', function() Snacks.picker.lazy() end, { desc = 'Search for Plugin Spec' })
map('n', '<leader>sq', function() Snacks.picker.qflist() end, { desc = 'Quickfix List' })
map('n', '<leader>sR', function() Snacks.picker.resume() end, { desc = 'Resume' })
map('n', '<leader>u', function() Snacks.picker.undo() end, { desc = 'Undo History' })
map('n', '<leader>uC', function() Snacks.picker.colorschemes() end, { desc = 'Colorschemes' })

-- LSP
map('n', 'gd', function() Snacks.picker.lsp_definitions() end, { desc = 'Goto Definition' })
map('n', 'gD', function() Snacks.picker.lsp_declarations() end, { desc = 'Goto Declaration' })
map('n', 'gr', function() Snacks.picker.lsp_references() end, { desc = 'References', nowait = true })
map('n', 'gI', function() Snacks.picker.lsp_implementations() end, { desc = 'Goto Implementation' })
map('n', 'gy', function() Snacks.picker.lsp_type_definitions() end, { desc = 'Goto T[y]pe Definition' })

map('n', '<leader>rn', function()
  local clients = vim.lsp.get_active_clients { bufnr = 0 }
  local has_rename = false

  for _, client in ipairs(clients) do
    if client.server_capabilities.renameProvider then
      has_rename = true
      break
    end
  end

  if has_rename then
    vim.lsp.buf.rename()
  else
    vim.notify('No LSP client with rename capability', vim.log.levels.WARN)
  end
end, { desc = 'Rename variable' })

map('n', '<leader>ss', function() Snacks.picker.lsp_symbols() end, { desc = 'LSP Symbols' })
map('n', '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, { desc = 'LSP Workspace Symbols' })

-- Other
map('n', '<leader>z', function() Snacks.zen() end, { desc = 'Toggle Zen Mode' })
map('n', '<leader>Z', function() Snacks.zen.zoom() end, { desc = 'Toggle Zoom' })
map('n', '<leader>.', function() Snacks.scratch() end, { desc = 'Toggle Scratch Buffer' })
map('n', '<leader>S', function() Snacks.scratch.select() end, { desc = 'Select Scratch Buffer' })
map('n', '<leader>n', function() Snacks.notifier.show_history() end, { desc = 'Notification History' })
map('n', '<leader>bd', function() Snacks.bufdelete() end, { desc = 'Delete Buffer' })
map('n', '<leader>cR', function() Snacks.rename.rename_file() end, { desc = 'Rename File' })
map({ 'n', 'v' }, '<leader>gB', function() Snacks.gitbrowse() end, { desc = 'Git Browse' })
map('n', '<leader>gg', function() Snacks.lazygit() end, { desc = 'Lazygit' })

map({ 'n', 't' }, ']]', function() Snacks.words.jump(vim.v.count1) end, { desc = 'Next Reference' })
map({ 'n', 't' }, '[[', function() Snacks.words.jump(-vim.v.count1) end, { desc = 'Prev Reference' })

-- Terminal (replaces toggleterm.nvim)
map({ 'n', 't' }, '<M-x>', function() Snacks.terminal.toggle() end, { desc = 'Toggle Terminal' })
map('t', '<C-e>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

-- 4. `init` block (replaces lazy.nvim's VeryLazy autocmd — run directly,
-- since vim.pack loads plugins at startup rather than lazily on an event)
_G.dd = function(...) Snacks.debug.inspect(...) end
_G.bt = function() Snacks.debug.backtrace() end
vim.print = _G.dd

Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>ts'
Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>tw'
Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tL'
Snacks.toggle.diagnostics():map '<leader>td'
Snacks.toggle.line_number():map '<leader>tl'
Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>tc'
Snacks.toggle.treesitter():map '<leader>tT'
Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>tB'
Snacks.toggle.inlay_hints():map '<leader>th'
Snacks.toggle.indent():map '<leader>tg'
Snacks.toggle.dim():map '<leader>td'
