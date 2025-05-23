local fzf = require('fzf-lua')
fzf.setup({
    'fzf-native',
    previewers = {
        builtin = {
            syntax = false
        },
        fzf_opts = {
            ['-i'] = '' -- How do i make this case insesitive?
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

-- Find and replace in current file
vim.keymap.set('n', '<leader>fr', function()
    local search = vim.fn.input("Search > ")
    if search == "" then
        return
    end
    local replacement = vim.fn.input("Replace with > ")
    if replacement ~= "" then
        vim.cmd(":%s/" .. vim.fn.escape(search, "/") .. "/" .. vim.fn.escape(replacement, "/") .. "/gc")
    end
end, { desc = "Find and Replace in current file" })

-- Replace word under cursor in whole file
vim.keymap.set('n', '<leader>rw', function()
    local word = vim.fn.expand('<cword>')
    if word == "" then
        print("No word under cursor")
        return
    end
    local replacement = vim.fn.input("Replace '" .. word .. "' with > ")
    if replacement ~= "" then
        vim.cmd(":%s/\\<" .. vim.fn.escape(word, "/\\") .. "\\>/" .. vim.fn.escape(replacement, "/") .. "/gc")
    end
end, { desc = "Replace Word under cursor in whole file" })
