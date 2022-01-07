local map = require('kutsan/utils').map
local g = vim.g

-- Skip setting defualt mappings.
g.lightspeed_no_default_keymaps = true

map('n', ';', '<Plug>Lightspeed_s', { noremap = false })
map('n', ',', '<Plug>Lightspeed_S', { noremap = false })
map('x', ';', '<Plug>Lightspeed_s', { noremap = false })
map('x', ',', '<Plug>Lightspeed_S', { noremap = false })
map('o', ';', '<Plug>Lightspeed_s', { noremap = false })
map('o', ',', '<Plug>Lightspeed_S', { noremap = false })

map('n', 'f', '<Plug>Lightspeed_f', { noremap = false })
map('n', 'F', '<Plug>Lightspeed_F', { noremap = false })
map('x', 'f', '<Plug>Lightspeed_f', { noremap = false })
map('x', 'F', '<Plug>Lightspeed_F', { noremap = false })
map('o', 'f', '<Plug>Lightspeed_f', { noremap = false })
map('o', 'F', '<Plug>Lightspeed_F', { noremap = false })

map('n', 't', '<Plug>Lightspeed_t', { noremap = false })
map('n', 'T', '<Plug>Lightspeed_T', { noremap = false })
map('x', 't', '<Plug>Lightspeed_t', { noremap = false })
map('x', 'T', '<Plug>Lightspeed_T', { noremap = false })
map('o', 't', '<Plug>Lightspeed_t', { noremap = false })
map('o', 'T', '<Plug>Lightspeed_T', { noremap = false })
