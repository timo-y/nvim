return
{
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
        keymap = {
            preset = 'default',
            ['<Tab>'] = { 'select_and_accept', 'fallback' },
            ['<S-Tab>'] = { 'select_next', 'fallback' },
        },

        appearance = {
            nerd_font_variant = 'mono'
        },

        signature = { enabled = true },

        completion = {
            documentation = { auto_show = true },
            menu = {
                draw = {
                    columns = {
                        { "label",     "label_description", gap = 1 },
                        { "kind_icon", "kind",              "source_name", gap = 1 }
                    },
                }
            },
        },
        fuzzy = { implementation = "lua" },
    },
    opts_extend = { "sources.default" }
}
