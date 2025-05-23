require('mini.icons').setup()
require('mini.ai').setup()
require('mini.surround').setup(-- No need to copy this inside `setup()`. Will be used automatically.
{
  mappings = {
    add = 'üa', -- Add surrounding in Normal and Visual modes
    delete = 'üd', -- Delete surrounding
    find = 'üf', -- Find surrounding (to the right)
    find_left = 'üF', -- Find surrounding (to the left)
    highlight = 'üh', -- Highlight surrounding
    replace = 'ür', -- Replace surrounding
    update_n_lines = 'ün', -- Update `n_lines`
  }
})
require('mini.completion').setup({
    window = {
        info = { border = 'single' },
        signature = { border = 'single' },
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    source = {
        lsp = { priority = 1000 },
        buffer = { priority = 500 },
        path = { priority = 250 },
        nvim_lua = { priority = 750 },
    },
})
require('mini.comment').setup()
require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.indentscope').setup({
    draw = {
        animation = require('mini.indentscope').gen_animation.none(),
    }
})
require('mini.diff').setup()
