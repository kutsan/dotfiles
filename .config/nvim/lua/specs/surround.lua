local Plugin = { 'kylechui/nvim-surround' }

Plugin.name = 'surround'
Plugin.version = '*'

Plugin.event = 'VeryLazy'

Plugin.opts = {
  keymaps = {
    normal = 'sa',
    visual = 'sa',
    delete = 'sd',
    change = 'sr',
    insert = false,
    insert_line = false,
  },
}

return Plugin
