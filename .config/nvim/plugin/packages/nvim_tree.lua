local keymap = vim.keymap
local nvim_tree = require('nvim-tree')

nvim_tree.setup({
  update_cwd = true,
  hijack_cursor = true,
  git = {
    ignore = false,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  view = {
    width = 32,
    mappings = {
      custom_only = true,
      list = {
        { key = { 'l', '<CR>', '<2-LeftMouse>' }, action = 'edit' },
        { key = 'L', action = 'cd' },
        { key = '<C-s>', action = 'split' },
        { key = '<C-v>', action = 'vsplit' },
        { key = '<C-t>', action = 'tabnew' },
        { key = 'h', action = 'close_node' },
        { key = '<Tab>', action = 'preview' },
        { key = 'R', action = 'refresh' },
        { key = 'c', action = 'create' },
        { key = 'D', action = 'trash' },
        { key = 'r', action = 'rename' },
        { key = '<C-r>', action = 'full_rename' },
        { key = 'd', action = 'cut' },
        { key = 'y', action = 'copy' },
        { key = 'p', action = 'paste' },
        { key = 'P', action = 'bulk_move' },
        { key = 'f', action = 'live_filter' },
        { key = '-', action = 'collapse_all' },
        { key = 'gyn', action = 'copy_name' },
        { key = 'gyp', action = 'copy_path' },
        {
          key = 'gya',
          action = 'copy_absolute_path',
        },
        { key = 'H', action = 'dir_up' },
        { key = 's', action = 'system_open' },
        { key = '<Space>', action = 'toggle_mark' },
        { key = 'K', action = 'toggle_file_info' },
        { key = '<', action = 'first_sibling' },
        { key = '>', action = 'last_sibling' },
      },
    },
  },
  renderer = {
    highlight_git = true,
    root_folder_modifier = ':t',
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        bookmark = '◉',
        git = {
          unstaged = '',
          staged = '',
          unmerged = '',
          renamed = '',
          deleted = '',
          untracked = '',
          ignored = '',
        },
        folder = {
          default = '',
          open = '',
          symlink = '',
        },
      },
      show = {
        git = false,
        file = true,
        folder = true,
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
})

keymap.set('n', '<Space>f', '<Cmd>NvimTreeToggle<CR>', { silent = true })
keymap.set('n', '<Space>F', '<Cmd>NvimTreeFindFile<CR>z.', { silent = true })
