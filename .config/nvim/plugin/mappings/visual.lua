local keymap = vim.keymap

-- Stay in visual mode when indenting.
keymap.set('x', '<', '<gv')
keymap.set('x', '>', '>gv')

-- Always search with 'very magic' mode.
keymap.set('x', '/', '/\\v')
keymap.set('x', '?', '?\\v')

-- Start a * or # search from a visual selection.
keymap.set(
  'x',
  '*',
  '<Cmd>lua require("kutsan/mappings/visual/search").set_search("/")<CR>/<C-R>=@/<CR><CR>'
)
keymap.set(
  'x',
  '#',
  '<Cmd>lua require("kutsan/mappings/visual/search").set_search("?")<CR>?<C-R>=@/<CR><CR>'
)

-- Refactor selection.
keymap.set('x', '<Space>c*', '*Ncgn', { noremap = false })
keymap.set('x', '<Space>c#', '#cgN', { noremap = false })
