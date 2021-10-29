local map = require('kutsan/utils').map

-- Define mappings.
map('n', '<Space>gs', '<Cmd>Git<CR>', { silent = true })
map('n', '<Space>gb', '<Cmd>Git blame<CR>', { silent = true })
map('n', '<Space>gd', '<Cmd>Gdiffsplit<CR>', { silent = true })
map('n', '<Space>gl', '<Cmd>0Gclog!<CR>', { silent = true })
map('n', '<Space>gL', '<Cmd>Gclog!<CR>', { silent = true })
