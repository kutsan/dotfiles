local Plugin = { 'zbirenbaum/copilot.lua' }

Plugin.name = 'copilot'

Plugin.cmd = 'Copilot'
Plugin.event = 'InsertEnter'

Plugin.opts = {
  panel = { enabled = false },
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept_word = '<M-w>',
    },
  },
  filetypes = {
    markdown = true,
  },
}

return Plugin
