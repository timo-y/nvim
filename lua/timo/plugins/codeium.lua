return {
    "Exafunction/codeium.vim",
    config = function()
        vim.g.codeium_detect_proxy = false -- Disable proxy-detection
        vim.g.codeium_enabled = true       -- Enable Codeium by default
        vim.g.codeium_idle_delay = 500     -- Set the idle delay (in milliseconds)
    end,
}
