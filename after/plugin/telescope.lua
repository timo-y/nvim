local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function()
    require('telescope.builtin').find_files({ hidden = true, no_ignore = false })
end, { desc = "Find Files (including hidden)" })

-- Open new tab and find fileo
vim.keymap.set('n', '<leader>pt', function()
    vim.cmd.tabnew();
    builtin.find_files();
end, { desc = "Open new Tab and Find Files" })

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find Git-Files" })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "Find Word under Cursor" })
