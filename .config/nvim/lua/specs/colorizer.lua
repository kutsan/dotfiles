local Plugin = { 'norcalli/nvim-colorizer.lua' }

Plugin.name = 'colorizer'

Plugin.config = function()
  local colorizer = require('colorizer')

  colorizer.setup()
end

return Plugin
