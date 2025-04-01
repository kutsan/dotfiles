local Plugin = { 'volskaya/windovigation.nvim' }

Plugin.name = 'windovigation'

Plugin.lazy = false

Plugin.opts = {
  keymaps = false,
}

Plugin.config = function(_, opts)
  local windovigation = require('windovigation')
  local actions = require('windovigation.actions')

  windovigation.setup(opts)

  vim.keymap.set('n', ']b', actions.move_to_previous_file)
  vim.keymap.set('n', '[b', actions.move_to_previous_file)
  vim.keymap.set('n', '[B', actions.move_to_first_file)
  vim.keymap.set('n', ']B', actions.move_to_last_file)
end

return Plugin
