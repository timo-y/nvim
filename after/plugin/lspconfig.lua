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
