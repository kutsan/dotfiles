local keymap = vim.keymap

-- Stay in visual mode when indenting.
keymap.set('x', '<', '<gv')
keymap.set('x', '>', '>gv')

-- Refactor selection.
keymap.set('x', '<Space>c*', '*Ncgn', { noremap = false })
keymap.set('x', '<Space>c#', '#cgN', { noremap = false })
