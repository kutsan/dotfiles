local Plugin = { 'folke/zen-mode.nvim' }

Plugin.name = 'zen-mode'

Plugin.opts = {
  window = {
    width = 100,
    options = {
      number = false,
      relativenumber = false,
    },
  },
}

return Plugin
