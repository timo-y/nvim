return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = false,
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            -- LSP Support
            {
                'neovim/nvim-lspconfig',
                cmd = 'LspInfo',
                event = { 'BufReadPre', 'BufNewFile' },
                dependencies = {
                    'hrsh7th/cmp-nvim-lsp',
                },

            },
            -- Mason
            --- Uncomment these if you want to manage LSP servers from neovim
            {
                'williamboman/mason.nvim',
                lazy = true,
                build = ":MasonUpdate",
                config = true,
                cmd = "Mason",
            },
            {
                'williamboman/mason-lspconfig.nvim',
                lazy = true,
                config = true,
            },
        },
    }
}
