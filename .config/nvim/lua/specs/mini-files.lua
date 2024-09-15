local Plugin = { 'echasnovski/mini.files' }

Plugin.name = 'mini-files'
Plugin.version = '*'

Plugin.opts = {
  options = {
    permanent_delete = false,
    use_as_default_explorer = false,
  },
}

Plugin.config = function(_, opts)
  local mini_files = require('mini.files')
  local keymap = vim.keymap

  mini_files.setup(opts)

  keymap.set('n', '-', function()
    mini_files.open()
  end, { silent = true })
end

return Plugin
