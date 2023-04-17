local copilot = require('copilot')
local copilot_cmp = require('copilot_cmp')

copilot.setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

copilot_cmp.setup()
