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
    dependencies = { 'saghen/blink.cmp' },
    handlers = {
        -- Add custom settings for specific servers
        lua_ls = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require('lspconfig').lua_ls.setup({
                capabilities = capabilities,
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
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require('lspconfig').pyright.setup({
                capabilities = capabilities,
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
