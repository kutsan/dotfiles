local keymap = vim.keymap

-- Stay in visual mode when indenting.
keymap.set('x', '<', '<gv')
keymap.set('x', '>', '>gv')

-- Always search with 'very magic' mode.
keymap.set('x', '/', '/\\v')
keymap.set('x', '?', '?\\v')

-- Refactor selection.
keymap.set('x', '<Space>c*', '*Ncgn', { noremap = false })
keymap.set('x', '<Space>c#', '#cgN', { noremap = false })
