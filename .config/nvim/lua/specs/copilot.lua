local Plugin = { 'zbirenbaum/copilot.lua' }

Plugin.name = 'copilot'

Plugin.cmd = 'Copilot'
Plugin.event = 'InsertEnter'

-- This is a workaround for the multiple line bug.
-- https://github.com/orgs/community/discussions/40522
Plugin.build =
  "sed -i '' 's/f\\.stop=\\[\\`/f.stop=[`\\n\\n/' ~/.local/share/nvim/lazy/copilot/copilot/dist/language-server.js"

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
