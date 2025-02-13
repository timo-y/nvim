-- Open file explorer
vim.keymap.set("n", "<leader>pm", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Quit Neovim
vim.keymap.set("n", "<leader>eq", "<cmd>q<CR>")

-- Move highlighted text up or down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor centered when scrolling down
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Keep cursor centered when scrolling up
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor centered when searching for next match
vim.keymap.set("n", "n", "nzzzv")

-- Keep cursor centered when searching for previous match
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to system clipboard in normal and visual mode
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Copy to system clipboard in normal mode (linewise)
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to black hole register in normal and visual mode
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Map Ctrl-c to Escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable the Ex mode mapping
vim.keymap.set("n", "Q", "<nop>")

-- Format the current buffer using LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Move to the next item in the quickfix list and center the cursor
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Move to the previous item in the quickfix list and center the cursor
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Move to the next item in the location list and center the cursor
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- Move to the previous item in the location list and center the cursor
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace the word under the cursor throughout the file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Find files containing word under cursor and perform replacement in quickfix list
vim.keymap.set("n", "<leader>pr", function()
    local current_word = vim.fn.expand("<cword>")

    local search_word = vim.fn.input("Search for (default: " .. current_word .. "): ", current_word)
    if search_word == "" then
        search_word = current_word
    end

    local search_pattern = vim.fn.input("Search pattern (default: **/*, i.e. Python files: **/*.py): ", "**/*")
    if search_pattern == "" then
        search_pattern = "**/*"
    end

    vim.cmd(string.format("vimgrep /%s/gj %s", search_word, search_pattern))

    vim.cmd("copen")

    local replace_word = vim.fn.input("Replace with (default: " .. search_word .. "): ", search_word)
    if replace_word == "" then
        replace_word = search_word
    end

    if search_word == replace_word then
        vim.cmd("echo 'Search word and replace word are the same. No changes made.'")
        return
    end

    local replace_cmd = string.format("cfdo %%s/%s/%s/gc | update", search_word, replace_word)

    vim.cmd(replace_cmd)
end, { desc = "Search and replace for word under cursor with editable prompts and pattern" })


-- Open floating window with diagnostics
vim.keymap.set("n", "<leader>h", vim.diagnostic.open_float)

-- Open Quickfix
vim.keymap.set("n", "<leader>o", vim.cmd.copen)
