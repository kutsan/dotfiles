local pounce = require('pounce')
local map = require('kutsan/utils').map

pounce.setup({
  multi_window = false,
})

map('n', '/', '<Cmd>Pounce<CR>')
map('n', '?', '<Cmd>Pounce<CR>')
