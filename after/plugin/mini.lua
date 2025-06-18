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
require('mini.statusline').setup({
    content = {
        active = function()
            local s = require('mini.statusline')
            local mode, mode_hl = s.section_mode({ trunc_width = 120 })
            local filename = s.section_filename({ trunc_width = 140 })
            local fileinfo = s.section_fileinfo({ trunc_width = 120 })
            local location = s.section_location({ trunc_width = 75 })

            return s.combine_groups({
                { hl = mode_hl,                  strings = { mode } },
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                '%=',
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                { hl = mode_hl,                  strings = { location } },
            })
        end,
    },
})

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
