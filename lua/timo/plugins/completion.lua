-- Autocompletion
return {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = { 'InsertEnter' },
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            lazy = true,
            event = "InsertEnter",
            config = function()
                require("luasnip").setup({
                    history = true,
                    -- Disable unnecessary features during startup
                    enable_autosnippets = false,
                    store_selection_keys = "<Tab>"
                })
            end
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'onsails/lspkind.nvim'
    }
}
