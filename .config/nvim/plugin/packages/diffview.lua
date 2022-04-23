local diffview = require('diffview')
local keymap = vim.keymap

diffview.setup({
  file_panel = {
    position = 'bottom',
    height = 10,
    listing_style = 'tree',
    tree_options = {
      flatten_dirs = false,
      folder_statuses = 'only_folded',
    },
  },
})

keymap.set('n', '<Space>gvo', '<Cmd>DiffviewOpen<CR>', { silent = true })
keymap.set('n', '<Space>gvl', '<Cmd>DiffviewFileHistory<CR>', { silent = true })

-- TODO: Add generic tab mappings and replace this with :tabclose.
keymap.set('n', '<Space>gvq', '<Cmd>DiffviewClose<CR>', { silent = true })
