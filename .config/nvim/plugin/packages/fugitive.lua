local map = require('kutsan.utils').map

-- Define mappings.
map('n', '<Space>gs', '<Cmd>Git<CR>', { noremap = true, silent = true })
map('n', '<Space>gb', '<Cmd>Git blame<CR>', { noremap = true, silent = true })
map('n', '<Space>gd', '<Cmd>Gdiffsplit<CR>', { noremap = true, silent = true })
map('n', '<Space>gl', '<Cmd>0Gclog!<CR>', { noremap = true, silent = true })
map('n', '<Space>gL', '<Cmd>Gclog!<CR>', { noremap = true, silent = true })
