local Plugin = { 'MagicDuck/grug-far.nvim' }

Plugin.name = 'grug-far'
Plugin.cmd = 'GrugFar'

Plugin.opts = { headerMaxWidth = 80 }

Plugin.keys = {
  {
    '<Space>sr',
    function()
      local grug_far = require('grug-far')

      local ext = vim.bo.buftype == '' and vim.fn.expand('%:e')

      grug_far.open({
        transient = true,
        prefills = {
          filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
        },
      })
    end,
    mode = { 'n', 'v' },
    desc = 'Search and Replace',
  },
}

return Plugin
