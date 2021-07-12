local tree_cmd = require('nvim-tree.config').nvim_tree_callback
local map = require('kutsan.utils').map
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

-- Highlight nodes according to current git status.
g.nvim_tree_git_hl = 1

-- Enable indent markers.
g.nvim_tree_indent_markers = 1

-- Disable special files.
g.nvim_tree_special_files = {}

-- Automatically close the tree if it's the last remaining window.
g.nvim_tree_auto_close = 1

-- Set key bindings.
g.nvim_tree_bindings = {
  { key = 'l', cb = tree_cmd('edit') },
  { key = '<C-s>', cb = tree_cmd('split') },
  { key = '<C-v>', cb = tree_cmd('vsplit') },
  { key = '<C-t>', cb = tree_cmd('tabnew') },
  { key = '<C-r>', cb = tree_cmd('refresh') },
  { key = 'h', cb = tree_cmd('close_node') },
  { key = 'L', cb = tree_cmd('cd') },
  { key = 'i', cb = tree_cmd('preview') },
  { key = 'c', cb = tree_cmd('create') },
  { key = 'D', cb = tree_cmd('remove') },
  { key = 'r', cb = tree_cmd('rename') },
  { key = 'd', cb = tree_cmd('cut') },
  { key = 'y', cb = tree_cmd('copy') },
  { key = 'p', cb = tree_cmd('paste') },
  { key = '[c', cb = tree_cmd('prev_git_item') },
  { key = ']c', cb = tree_cmd('next_git_item') },
}

map(
  'n',
  '<Space>f',
  '<Cmd>NvimTreeToggle<CR>',
  { noremap = true, silent = true }
)
map(
  'n',
  '<Space>F',
  '<Cmd>NvimTreeFindFile<CR>z.',
  { noremap = true, silent = true }
)

api.nvim_command([[
  augroup nvimtreesettings
    autocmd BufWinEnter NvimTree let &l:statusline = ' nvimtree'
  augroup end
]])
