local autopairs = require('nvim-autopairs')
local autopairs_cmp_completion = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

autopairs.setup({})

cmp.event:on('confirm_done', autopairs_cmp_completion.on_confirm_done())
