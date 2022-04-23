local keymap = vim.keymap

-- Define mappings.
keymap.set('n', '<Space>gb', '<Cmd>Git blame<CR>', { silent = true })
keymap.set('n', '<Space>gd', '<Cmd>Gdiffsplit<CR>', { silent = true })
