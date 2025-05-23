-- Detect the shell dynamically based on the operating system
local shell = nil
if vim.loop.os_uname().sysname == "Windows_NT" then
    -- Use pwsh (PowerShell Core) if available, otherwise fallback to PowerShell
    shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
else
    -- Use bash for Linux and other Unix-like systems
    -- shell = "/bin/bash" -- Adjust the path if necessary (e.g., /usr/bin/bash)
    shell = "/root/.nix-profile/bin/zsh"
end

require('toggleterm').setup({
    size = 15,
    open_mapping = [[<C-x>]],
    autochdir = true,
    direction = 'horizontal',
    shell = shell -- Set the dynamically selected shell
})

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<C-e>', [[<C-\><C-n>]], opts)
end

-- Apply terminal keymaps for toggleterm
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

