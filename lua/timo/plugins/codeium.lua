return {
    "Exafunction/codeium.vim",
    config = function()
        vim.g.codeium_enabled = true -- Enable Codeium by default
        vim.g.codeium_idle_delay = 500 -- Set the idle delay (in milliseconds)
    end,
}
-- return {
--    'Exafunction/codeium.vim',
--    event = 'BufEnter',
--}
