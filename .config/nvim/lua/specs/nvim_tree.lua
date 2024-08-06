local Plugin = { 'nvim-tree/nvim-tree.lua' }

Plugin.name = 'nvim-tree'

Plugin.cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' }
Plugin.keys = { '<Space>f', '<Space>F' }

Plugin.config = function()
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

    keymap.set('n', 'l', nvim_tree_api.node.open.edit, opts('Open'))
    keymap.set('n', '<CR>', nvim_tree_api.node.open.edit, opts('Open'))
    keymap.set('n', '<2-LeftMouse>', nvim_tree_api.node.open.edit, opts('Open'))
    keymap.set('n', 'L', nvim_tree_api.tree.change_root_to_node, opts('CD'))
    keymap.set(
      'n',
      '<C-s>',
      nvim_tree_api.node.open.horizontal,
      opts('Open: Horizontal Split')
    )
    keymap.set(
      'n',
      '<C-v>',
      nvim_tree_api.node.open.vertical,
      opts('Open: Vertical Split')
    )
    keymap.set('n', '<C-t>', nvim_tree_api.node.open.tab, opts('Open: New Tab'))
    keymap.set(
      'n',
      'h',
      nvim_tree_api.node.navigate.parent_close,
      opts('Close Directory')
    )
    keymap.set(
      'n',
      '<Tab>',
      nvim_tree_api.node.open.preview,
      opts('Open Preview')
    )
    keymap.set('n', 'R', nvim_tree_api.tree.reload, opts('Refresh'))
    keymap.set('n', 'c', nvim_tree_api.fs.create, opts('Create'))
    keymap.set('n', 'D', nvim_tree_api.fs.trash, opts('Trash'))
    keymap.set('n', 'r', nvim_tree_api.fs.rename, opts('Rename'))
    keymap.set(
      'n',
      '<C-r>',
      nvim_tree_api.fs.rename_sub,
      opts('Rename: Omit Filename')
    )
    keymap.set('n', 'd', nvim_tree_api.fs.cut, opts('Cut'))
    keymap.set('n', 'y', nvim_tree_api.fs.copy.node, opts('Copy'))
    keymap.set('n', 'p', nvim_tree_api.fs.paste, opts('Paste'))
    keymap.set('n', 'P', nvim_tree_api.marks.bulk.move, opts('Move Bookmarked'))
    keymap.set('n', 'f', nvim_tree_api.live_filter.start, opts('Filter'))
    keymap.set('n', '-', nvim_tree_api.tree.collapse_all, opts('Collapse'))
    keymap.set('n', 'gyn', nvim_tree_api.fs.copy.filename, opts('Copy Name'))
    keymap.set(
      'n',
      'gyp',
      nvim_tree_api.fs.copy.relative_path,
      opts('Copy Relative Path')
    )
    keymap.set(
      'n',
      'gya',
      nvim_tree_api.fs.copy.absolute_path,
      opts('Copy Absolute Path')
    )
    keymap.set('n', 'H', nvim_tree_api.tree.change_root_to_parent, opts('Up'))
    keymap.set('n', 's', nvim_tree_api.node.run.system, opts('Run System'))
    keymap.set('n', 't', nvim_tree_api.marks.toggle, opts('Toggle Bookmark'))
    keymap.set('n', 'K', nvim_tree_api.node.show_info_popup, opts('Info'))
    keymap.set(
      'n',
      '<',
      nvim_tree_api.node.navigate.sibling.first,
      opts('First Sibling')
    )
    keymap.set(
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
    sync_root_with_cwd = true,
    view = {
      preserve_window_proportions = true,
      width = {
        min = 32,
        max = 56,
      },
    },
    update_focused_file = {
      enable = true,
    },
    renderer = {
      highlight_git = true,
      root_folder_modifier = ':t',
      icons = {
        glyphs = {
          default = '󰈔',
          symlink = '󱅷',
          bookmark = '◉',
          folder = {
            default = '',
            open = '',
            empty = '󰉖',
            empty_open = '',
            symlink = '',
            symlink_open = '',
          },
          git = {
            unstaged = '',
            staged = '',
            unmerged = '',
            renamed = '',
            deleted = '',
            untracked = '',
            ignored = '',
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
end

return Plugin
