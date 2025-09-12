-- ~/.config/nvim/lua/plugins/toggleterm.lua
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  lazy = false,
  config = function()
    -- Detect the shell dynamically based on the operating system
    local shell
    if vim.loop.os_uname().sysname == 'Windows_NT' then
      shell = vim.fn.executable 'pwsh' == 1 and 'pwsh' or 'powershell'
    else
      shell = '/root/.nix-profile/bin/zsh' -- adjust if needed
    end

    require('toggleterm').setup {
      size = 15,
      open_mapping = [[<C-x>]],
      autochdir = true,
      direction = 'horizontal',
      shell = shell,
    }

    -- Terminal mode keymaps
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<C-e>', [[<C-\><C-n>]], opts)
    end

    -- Apply the keymaps when a terminal is opened
    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*',
      callback = function()
        set_terminal_keymaps()
      end,
    })
  end,
}
