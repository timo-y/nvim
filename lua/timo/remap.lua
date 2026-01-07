vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Open file explorer
vim.keymap.set('n', '<leader>pm', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Quit Neovim
vim.keymap.set('n', '<leader>eq', '<cmd>q<CR>')

-- Move highlighted text up or down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep cursor centered when joining lines
vim.keymap.set('n', 'J', 'mzJ`z')

-- Keep cursor centered when scrolling down
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Keep cursor centered when scrolling up
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep cursor centered when searching for next match
vim.keymap.set('n', 'n', 'nzzzv')

-- Keep cursor centered when searching for previous match
vim.keymap.set('n', 'N', 'Nzzzv')

-- Copy to system clipboard in normal and visual mode
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])

-- Copy to system clipboard in normal mode (linewise)
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Delete to black hole register in normal and visual mode
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- Map Ctrl-c to Escape in insert mode
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Disable the Ex mode mapping
vim.keymap.set('n', 'Q', '<nop>')

-- Format the current buffer using LSP
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Move to the next item in the quickfix list and center the cursor
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')

-- Move to the previous item in the quickfix list and center the cursor
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')

-- Move to the next item in the location list and center the cursor
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')

-- Move to the previous item in the location list and center the cursor
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- Replace the word under the cursor throughout the file
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Helper function for vimgrep search across files
local function vimgrep_search()
  local current_word = vim.fn.expand '<cword>'

  local search_word = vim.fn.input('Search for (default: ' .. current_word .. '): ', current_word)
  if search_word == '' then
    search_word = current_word
  end

  local search_pattern = vim.fn.input('Search pattern (default: **/*, i.e. Python files: **/*.py): ', '**/*')
  if search_pattern == '' then
    search_pattern = '**/*'
  end

  vim.cmd(string.format('vimgrep /%s/gj %s', search_word, search_pattern))
  vim.cmd 'copen'

  return search_word
end

-- Search only: Find files containing word under cursor
vim.keymap.set('n', '<leader>po', function()
  vimgrep_search()
end, { desc = 'Search for word under cursor across files (quickfix)' })

-- Find files containing word under cursor and perform replacement in quickfix list
vim.keymap.set('n', '<leader>pr', function()
  local search_word = vimgrep_search()

  local replace_word = vim.fn.input('Replace with (default: ' .. search_word .. '): ', search_word)
  if replace_word == '' then
    replace_word = search_word
  end

  if search_word == replace_word then
    vim.cmd "echo 'Search word and replace word are the same. No changes made.'"
    return
  end

  local replace_cmd = string.format('cfdo %%s/%s/%s/gc | update', search_word, replace_word)

  vim.cmd(replace_cmd)
end, { desc = 'Search and replace for word under cursor with editable prompts and pattern' })

-- Find and replace in current file
vim.keymap.set('n', '<leader>fr', function()
  local search = vim.fn.input 'Search > '
  if search == '' then
    return
  end
  local replacement = vim.fn.input 'Replace with > '
  if replacement ~= '' then
    vim.cmd(':%s/' .. vim.fn.escape(search, '/') .. '/' .. vim.fn.escape(replacement, '/') .. '/gc')
  end
end, { desc = 'Find and Replace in current file' })

-- Replace word under cursor in whole file
vim.keymap.set('n', '<leader>rw', function()
  local word = vim.fn.expand '<cword>'
  if word == '' then
    print 'No word under cursor'
    return
  end
  local replacement = vim.fn.input("Replace '" .. word .. "' with > ")
  if replacement ~= '' then
    vim.cmd(':%s/\\<' .. vim.fn.escape(word, '/\\') .. '\\>/' .. vim.fn.escape(replacement, '/') .. '/gc')
  end
end, { desc = 'Replace Word under cursor in whole file' })

-- Open diagnostics
vim.keymap.set('n', '<leader>h', vim.diagnostic.open_float, { desc = 'Open diagnostic [h]int window' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Open Quickfix
vim.keymap.set('n', '<leader>o', vim.cmd.copen, { desc = '[O]pen Quickfix' })

-- Go to nex error with floating messaged
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next [d]iagnostic message' })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous [d]iagnostic message' })

-- Open Vertical Split
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>', { desc = 'Open [v]ertical [s]plit' })

-- Split shortcut
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent = true })

-- LSP keymaps
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--     vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--     vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--   end,
-- })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
