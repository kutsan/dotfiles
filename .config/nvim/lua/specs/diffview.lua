local Plugin = { 'sindrets/diffview.nvim' }

Plugin.name = 'diffview'

Plugin.opts = {
  enhanced_diff_hl = true,
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
  hooks = {
    diff_buf_win_enter = function()
      vim.opt_local.cursorline = false
    end,
  },
}

Plugin.config = function(_, opts)
  local diffview = require('diffview')

  diffview.setup(opts)

  local keymap = vim.keymap

  keymap.set('n', '<Space>gd', function()
    local diffview_lib = require('diffview.lib')
    local current_diffview_view = diffview_lib.get_current_view()

    if current_diffview_view then
      vim.cmd.DiffviewClose()
    else
      vim.cmd.DiffviewOpen()
    end
  end, { silent = true })

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
end

return Plugin
