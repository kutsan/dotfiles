local Plugin = { 'sindrets/diffview.nvim' }

Plugin.name = 'diffview'

Plugin.opts = {
  file_panel = {
    listing_style = 'list',
    win_config = {
      position = 'bottom',
      height = 10,
    },
    tree_options = {
      flatten_dirs = false,
      folder_statuses = 'only_folded',
    },
  },
}

Plugin.config = function(_, opts)
  local diffview = require('diffview')

  diffview.setup(opts)

  local keymap = vim.keymap

  keymap.set('n', '<Space>gvo', '<Cmd>DiffviewOpen<CR>', { silent = true })
  keymap.set(
    'n',
    '<Space>gl',
    '<Cmd>DiffviewFileHistory %<CR>',
    { silent = true }
  )
  keymap.set(
    'n',
    '<Space>gL',
    '<Cmd>DiffviewFileHistory<CR>',
    { silent = true }
  )

  -- TODO: Add generic tab mappings and replace this with :tabclose.
  keymap.set('n', '<Space>gvq', '<Cmd>DiffviewClose<CR>', { silent = true })
end

return Plugin
