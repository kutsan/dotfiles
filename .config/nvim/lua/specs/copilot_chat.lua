local Plugin = { 'CopilotC-Nvim/CopilotChat.nvim' }

Plugin.name = 'copilot-chat'

Plugin.opts = {
  model = 'gpt-4o',
  question_header = '# ',
  answer_header = '# ',
  error_header = '# ',
  separator = ' ',
  show_folds = false,
  show_help = false,
  window = {
    layout = 'float',
    width = 0.7,
    height = 0.8,
  },
  mappings = {
    complete = {
      insert = '',
    },
  },
}

Plugin.config = function(_, opts)
  local copilot = require('CopilotChat')
  local copilot_select = require('CopilotChat.select')

  copilot.setup(opts)

  local keymap = vim.keymap

  keymap.set({ 'n', 'x' }, '<Space>cn', function()
    local input = vim.fn.input('Quick Chat: ')

    if input ~= '' then
      copilot.ask(input, { selection = copilot_select.buffer })
    end
  end)

  keymap.set('n', '<Space>cf', vim.cmd.CopilotChatToggle)
end

return Plugin
