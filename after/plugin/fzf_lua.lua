local fzf = require('fzf-lua')
fzf.setup({
    {
        'fzf-native',
        winopts = {
            preview = { default = 'bat' },
        },
    },
    previewers = {
        builtin = {
            syntax = true
        },
        fzf_opts = {
            ['-i'] = '' -- How do i make this case insesitive?
        }
    },
    files = {
        fd_opts = '--type f --hidden --exclude node_modules --exclude .git --exclude .venv',
        previewer = 'bat',
        sort_lastused = true
    },
    buffers = {
        sort_lastused = true,
        previewer = 'bat',
    },
    grep = {
        cmd = 'rg --line-number --column --no-heading --color=always --smart-case',
        rg_opts = '--hidden --glob "!node_modules/*" --glob "!.git/*" --glob "!.venv/*"',
        previewer = 'bat',
    },
    live_grep = {
        cmd = 'rg --line-number --column --no-heading --color=always --smart-case',
        rg_opts = '--hidden --glob "!node_modules/*" --glob "!.git/*" --glob "!.venv/*"',
        previewer = 'bat',
    },
    git = {
        files = {
            previewer = 'bat',
        },
    },
    fzf_opts = {
        ['--tiebreak'] = 'index',
    },
    defaults = {
        git_icons = true,
        file_icons = true,
        color_icons = true,
    },
})
-- Find files (including hidden)
vim.keymap.set('n', '<leader>pf', function()
    fzf.files()
end, { desc = "Find Files" })

-- Open new tab and find files
vim.keymap.set('n', '<leader>pt', function()
    vim.cmd.tabnew()
    fzf.files()
end, { desc = "Open new Tab and Find Files" })

-- Live Grep
vim.keymap.set('n', '<C-p>', fzf.live_grep, { desc = "Live Grep" })

-- Grep with input
vim.keymap.set('n', '<leader>ps', function()
    fzf.grep({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep Search" })

-- Find buffers
vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = "Find Buffers" })

-- Find word under cursor
vim.keymap.set('n', '<leader>fw', fzf.grep_cword, { desc = "Find Word under Cursor" })
