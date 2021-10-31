local map = require('kutsan/utils').map

-- Stay in visual mode when indenting.
map('x', '<', '<gv')
map('x', '>', '>gv')

-- Always search with 'very magic' mode.
map('x', '/', '/\\v')
map('x', '?', '?\\v')
