local Plugin = { 'zbirenbaum/copilot.lua' }

Plugin.name = 'copilot'

Plugin.cmd = 'Copilot'
Plugin.event = 'InsertEnter'

Plugin.opts = {
  suggestion = {
    auto_trigger = true,
  },
}

return Plugin
