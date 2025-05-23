require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
require('lspconfig').pyright.setup({
    settings = {
        python = {
            analysis = {
                autoImportCompletions = true,
                diagnosticMode = "workspace", -- Enables project-wide analysis
                autoSearchPaths = true,
                indexing = true
            }
        }
    },
    -- Optimize root directory detection
    root_dir = require('lspconfig.util').root_pattern(
        "pyproject.toml", "setup.py", "setup.cfg",
        "requirements.txt", ".git"
    ),
})
-- Set up LSP server
require('lspconfig').pyright.setup({
    on_attach = function(client, bufnr)
        -- Enable completion triggered by <C-x><C-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end,
})
