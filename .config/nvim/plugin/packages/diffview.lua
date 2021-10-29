local map = require('kutsan/utils').map
local diffview = require('diffview')

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

map('n', '<Space>gvo', '<Cmd>DiffviewOpen<CR>', { silent = true })
map('n', '<Space>gvh', '<Cmd>DiffviewFileHistory<CR>', { silent = true })

-- TODO: Add generic tab mappings and replace this with :tabclose.
map('n', '<Space>gvq', '<Cmd>DiffviewClose<CR>', { silent = true })
