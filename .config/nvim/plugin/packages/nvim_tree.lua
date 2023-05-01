local nvim_tree = require('nvim-tree')
local nvim_tree_api = require('nvim-tree.api')
local keymap = vim.keymap

local function on_attach(bufnr)
  local function opts(desc)
    return {
      desc = ('nvim-tree: %s'):format(desc),
      buffer = bufnr,
      silent = true,
    }
  end

  vim.keymap.set('n', 'l', nvim_tree_api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<CR>', nvim_tree_api.node.open.edit, opts('Open'))
  vim.keymap.set(
    'n',
    '<2-LeftMouse>',
    nvim_tree_api.node.open.edit,
    opts('Open')
  )
  vim.keymap.set('n', 'L', nvim_tree_api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set(
    'n',
    '<C-s>',
    nvim_tree_api.node.open.horizontal,
    opts('Open: Horizontal Split')
  )
  vim.keymap.set(
    'n',
    '<C-v>',
    nvim_tree_api.node.open.vertical,
    opts('Open: Vertical Split')
  )
  vim.keymap.set(
    'n',
    '<C-t>',
    nvim_tree_api.node.open.tab,
    opts('Open: New Tab')
  )
  vim.keymap.set(
    'n',
    'h',
    nvim_tree_api.node.navigate.parent_close,
    opts('Close Directory')
  )
  vim.keymap.set(
    'n',
    '<Tab>',
    nvim_tree_api.node.open.preview,
    opts('Open Preview')
  )
  vim.keymap.set('n', 'R', nvim_tree_api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'c', nvim_tree_api.fs.create, opts('Create'))
  vim.keymap.set('n', 'D', nvim_tree_api.fs.trash, opts('Trash'))
  vim.keymap.set('n', 'r', nvim_tree_api.fs.rename, opts('Rename'))
  vim.keymap.set(
    'n',
    '<C-r>',
    nvim_tree_api.fs.rename_sub,
    opts('Rename: Omit Filename')
  )
  vim.keymap.set('n', 'd', nvim_tree_api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'y', nvim_tree_api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'p', nvim_tree_api.fs.paste, opts('Paste'))
  vim.keymap.set(
    'n',
    'P',
    nvim_tree_api.marks.bulk.move,
    opts('Move Bookmarked')
  )
  vim.keymap.set('n', 'f', nvim_tree_api.live_filter.start, opts('Filter'))
  vim.keymap.set('n', '-', nvim_tree_api.tree.collapse_all, opts('Collapse'))
  vim.keymap.set('n', 'gyn', nvim_tree_api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set(
    'n',
    'gyp',
    nvim_tree_api.fs.copy.relative_path,
    opts('Copy Relative Path')
  )
  vim.keymap.set(
    'n',
    'gya',
    nvim_tree_api.fs.copy.absolute_path,
    opts('Copy Absolute Path')
  )
  vim.keymap.set('n', 'H', nvim_tree_api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 's', nvim_tree_api.node.run.system, opts('Run System'))
  vim.keymap.set(
    'n',
    '<Space>',
    nvim_tree_api.marks.toggle,
    opts('Toggle Bookmark')
  )
  vim.keymap.set('n', 'K', nvim_tree_api.node.show_info_popup, opts('Info'))
  vim.keymap.set(
    'n',
    '<',
    nvim_tree_api.node.navigate.sibling.first,
    opts('First Sibling')
  )
  vim.keymap.set(
    'n',
    '>',
    nvim_tree_api.node.navigate.sibling.last,
    opts('Last Sibling')
  )
end

nvim_tree.setup({
  on_attach = on_attach,
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
