local fzf = require('fzf-lua')
fzf.setup({
    'fzf-native',
    previewers = {
        builtin = {
            syntax = false
        },
        bat = {
            cmd = "bat"
        }
    }
})
-- Find files (including hidden)
vim.keymap.set('n', '<leader>pf', function()
    fzf.files({
        cmd = "fd --type f --hidden --follow --exclude .git"
    })
end, { desc = "Find Files (including hidden)" })

-- Open new tab and find files
vim.keymap.set('n', '<leader>pt', function()
    vim.cmd.tabnew()
    fzf.files()
end, { desc = "Open new Tab and Find Files" })

-- Find git files
vim.keymap.set('n', '<C-p>', fzf.git_files, { desc = "Find Git-Files" })

-- Grep with input
vim.keymap.set('n', '<leader>ps', function()
    fzf.grep({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep Search" })

-- Find buffers
vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = "Find Buffers" })

-- Find word under cursor
vim.keymap.set('n', '<leader>fw', fzf.grep_cword, { desc = "Find Word under Cursor" })
