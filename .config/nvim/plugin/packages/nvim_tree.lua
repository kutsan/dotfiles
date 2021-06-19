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
  ['l'] = tree_cmd('edit'),
  ['<C-s>'] = tree_cmd('split'),
  ['<C-v>'] = tree_cmd('vsplit'),
  ['<C-t>'] = tree_cmd('tabnew'),
  ['<C-r>'] = tree_cmd('refresh'),
  ['h'] = tree_cmd('close_node'),
  ['L'] = tree_cmd('cd'),
  ['i'] = tree_cmd('preview'),
  ['c'] = tree_cmd('create'),
  ['D'] = tree_cmd('remove'),
  ['r'] = tree_cmd('rename'),
  ['d'] = tree_cmd('cut'),
  ['y'] = tree_cmd('copy'),
  ['p'] = tree_cmd('paste'),
  ['[c'] = tree_cmd('prev_git_item'),
  [']c'] = tree_cmd('next_git_item'),
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
  '<Cmd>NvimTreeFindFile<CR>',
  { noremap = true, silent = true }
)

api.nvim_command([[
  augroup nvimtreesettings
    autocmd BufWinEnter NvimTree let &l:statusline = ' nvimtree'
  augroup end
]])
