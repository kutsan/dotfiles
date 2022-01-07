local map = require('kutsan/utils').map

-- Stay in visual mode when indenting.
map('x', '<', '<gv')
map('x', '>', '>gv')

-- Always search with 'very magic' mode.
map('x', '/', '/\\v')
map('x', '?', '?\\v')

-- Start a * or # search from a visual selection.
map(
  'x',
  '*',
  '<Cmd>lua require("kutsan/mappings/visual/search").set_search("/")<CR>/<C-R>=@/<CR><CR>'
)
map(
  'x',
  '#',
  '<Cmd>lua require("kutsan/mappings/visual/search").set_search("?")<CR>?<C-R>=@/<CR><CR>'
)

-- Refactor selection.
map('x', '<Space>c*', '*Ncgn', { noremap = false })
map('x', '<Space>c#', '#cgN', { noremap = false })
