local map = require('kutsan/utils').map

-- Define mappings.
map('n', '<Space>gb', '<Cmd>Git blame<CR>', { silent = true })
map('n', '<Space>gd', '<Cmd>Gdiffsplit<CR>', { silent = true })
