vim.defer_fn(function()
  require('copilot').setup()
  require('copilot_cmp').setup()
end, 100)
