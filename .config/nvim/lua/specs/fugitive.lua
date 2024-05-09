local Plugin = { 'tpope/vim-fugitive' }

Plugin.name = 'fugitive'

Plugin.keys = { '<Space>gb', '<Space>gd' }
Plugin.cmd = { 'Git', 'Gdiffsplit', 'Gread' }

Plugin.config = function()
  local keymap = vim.keymap

  keymap.set('n', '<Space>gb', '<Cmd>Git blame<CR>', { silent = true })
  keymap.set('n', '<Space>gd', '<Cmd>Gdiffsplit<CR>', { silent = true })
end

return Plugin
