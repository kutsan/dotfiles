local Plugin = { 'ZWindL/orphans.nvim' }

Plugin.name = 'orphans'

Plugin.cmd = 'Orphans'

Plugin.config = function()
  local orphans = require('orphans')

  orphans.setup()
end

return Plugin
