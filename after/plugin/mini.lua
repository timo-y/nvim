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
require('mini.completion').setup()
require('mini.comment').setup()
require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.indentscope').setup({
    draw = {
        animation = require('mini.indentscope').gen_animation.none(),
    }
})
require('mini.diff').setup()
