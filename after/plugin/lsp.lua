local lsp_zero = require('lsp-zero')

-- Apply the recommended preset before any other configurations
lsp_zero.preset('recommended')

-- Improve diagnostics appearance
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- Enhanced on_attach function with more useful keymaps
lsp_zero.on_attach(function(client, bufnr)
    -- Basic keymaps
    lsp_zero.default_keymaps({ buffer = bufnr })

    -- Additional keymaps for enhanced functionality
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

    -- Enable formatting if the LSP supports it
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end)

-- Mason setup with more LSP servers
require('mason').setup({
    ui = {
        border = 'rounded',
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    ensure_installed = {
        "pyright", -- Python
        "ruff",    -- Python linter
        "lua_ls",  -- Lua
        "html",    -- HTML
        "jsonls",  -- JSON
    },
    handlers = {
        lsp_zero.default_setup,
        -- Add custom settings for specific servers
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
        end,
        pyright = function()
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
        end,
    },
})
