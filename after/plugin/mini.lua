require('mini.icons').setup()
require('mini.ai').setup()
require('mini.surround').setup()
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
