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
        -- Default handler for all servers
        function(server_name)
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require('lspconfig')[server_name].setup({
                capabilities = capabilities,
            })
        end,

        -- Your existing custom handlers
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
                            diagnosticMode = "workspace",
                            autoSearchPaths = true,
                            indexing = true
                        }
                    }
                },
                root_dir = require('lspconfig.util').root_pattern(
                    "pyproject.toml", "setup.py", "setup.cfg",
                    "requirements.txt", ".git"
                ),
            })
        end,
    },
})
