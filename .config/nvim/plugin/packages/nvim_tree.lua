local map = require('kutsan/utils').map
local api = vim.api
local g = vim.g

-- Set whether or not to show certain icons.
g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
}

-- Customize icons.
g.nvim_tree_icons = {
  default = '',
  symlink = '',
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
}

-- Only show the current folder as the root instead of full path.
g.nvim_tree_root_folder_modifier = ':t'

-- Highlight nodes according to current git status.
g.nvim_tree_git_hl = 1

-- Enable indent markers.
g.nvim_tree_indent_markers = 1

local nvim_tree = require('nvim-tree')
nvim_tree.setup({
  update_cwd = true,
  hijack_cursor = true,
  git = {
    ignore = false,
  },
  view = {
    auto_resize = true,
    mappings = {
      custom_only = true,
      list = {
        { key = { 'l', '<CR>', '<2-LeftMouse>' }, action = 'edit' },
        { key = 'L', action = 'cd' },
        { key = '<C-s>', action = 'split' },
        { key = '<C-v>', action = 'vsplit' },
        { key = '<C-t>', action = 'tabnew' },
        { key = 'h', action = 'close_node' },
        { key = 'i', action = 'preview' },
        { key = 'R', action = 'refresh' },
        { key = 'c', action = 'create' },
        { key = 'D', action = 'trash' },
        { key = 'r', action = 'rename' },
        { key = 'd', action = 'cut' },
        { key = 'y', action = 'copy' },
        { key = 'p', action = 'paste' },
        { key = 'gyn', action = 'copy_name' },
        { key = 'gyp', action = 'copy_path' },
        {
          key = 'gya',
          action = 'copy_absolute_path',
        },
        { key = 'H', action = 'dir_up' },
        { key = 's', action = 'system_open' },
        { key = 'q', action = 'close' },
      },
    },
  },
})

map('n', '<Space>f', '<Cmd>NvimTreeToggle<CR>', { silent = true })
map('n', '<Space>F', '<Cmd>NvimTreeFindFile<CR>z.', { silent = true })

api.nvim_command([[
  augroup nvimtreesettings
    autocmd BufWinEnter NvimTree let &l:statusline = ' nvimtree'
  augroup end
]])
