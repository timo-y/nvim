require('mini.icons').setup()
--          ╭─────────────────────────────────────────────────────────╮
--          │                     AI and surround                     │
--          ╰─────────────────────────────────────────────────────────╯
require('mini.ai').setup()
require('mini.surround').setup(
    {
        mappings = {
            add = 'üa',            -- Add surrounding in Normal and Visual modes
            delete = 'üd',         -- Delete surrounding
            find = 'üf',           -- Find surrounding (to the right)
            find_left = 'üF',      -- Find surrounding (to the left)
            highlight = 'üh',      -- Highlight surrounding
            replace = 'ür',        -- Replace surrounding
            update_n_lines = 'ün', -- Update `n_lines`
        }
    })
--          ╭─────────────────────────────────────────────────────────╮
--          │                         COMMENT                         │
--          ╰─────────────────────────────────────────────────────────╯
require('mini.comment').setup()
--          ╭─────────────────────────────────────────────────────────╮
--          │                    STATUS- & TABLINE                    │
--          ╰─────────────────────────────────────────────────────────╯
require('mini.statusline').setup()
require('mini.tabline').setup()
--          ╭─────────────────────────────────────────────────────────╮
--          │                       INDENTSCOPE                       │
--          ╰─────────────────────────────────────────────────────────╯
-- require('mini.indentscope').setup({
--     draw = {
--         animation = require('mini.indentscope').gen_animation.none(),
--     }
-- })
-- --          ╭─────────────────────────────────────────────────────────╮
--          │                          DIFF                           │
--          ╰─────────────────────────────────────────────────────────╯
require('mini.diff').setup()
