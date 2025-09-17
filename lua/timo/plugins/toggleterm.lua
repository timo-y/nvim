-- ~/.config/nvim/lua/plugins/toggleterm.lua
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  lazy = false,
  config = function()
    -- Detect the shell dynamically based on the operating system
    local shell
    local os_name = vim.loop.os_uname().sysname
    if os_name == 'Windows_NT' then
      -- Prefer PowerShell Core if available, otherwise fall back to Windows PowerShell
      shell = vim.fn.executable 'pwsh' == 1 and 'pwsh' or 'powershell'
    elseif os_name == 'Darwin' then
      -- macOS: try iTerm2 if installed, otherwise use the default zsh
      if vim.fn.executable '/Applications/iTerm.app/Contents/MacOS/iTerm2' == 1 then
        shell = '/Applications/iTerm.app/Contents/MacOS/iTerm2'
      else
        shell = '/bin/zsh'
      end
    else
      -- Linux: try several possible zsh locations, then alacritty, finally fallback to bash
      if vim.fn.executable '/root/.nix-profile/bin/zsh' == 1 then
        shell = '/root/.nix-profile/bin/zsh'
      elseif vim.fn.executable '/nix/var/nix/profiles/default/bin/zsh' == 1 then
        shell = '/nix/var/nix/profiles/default/bin/zsh'
      elseif vim.fn.executable '/usr/bin/alacritty' == 1 then
        shell = '/usr/bin/alacritty'
      else
        shell = '/bin/bash'
      end
    end

    require('toggleterm').setup {
      size = 15,
      open_mapping = [[<M-x>]],
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
