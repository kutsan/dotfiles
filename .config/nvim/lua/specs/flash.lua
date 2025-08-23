local Plugin = { 'folke/flash.nvim' }

Plugin.name = 'flash'

Plugin.event = 'VeryLazy'

Plugin.keys = {
  {
    'sk',
    mode = { 'n', 'x', 'o' },
    function()
      require('flash').jump()
    end,
    desc = 'Flash',
  },
  {
    'S',
    mode = { 'n', 'x', 'o' },
    function()
      require('flash').treesitter()
    end,
    desc = 'Flash treesitter',
  },
  {
    'r',
    mode = 'o',
    function()
      require('flash').remote()
    end,
    desc = 'Remote Flash',
  },
  {
    'R',
    mode = { 'o', 'x' },
    function()
      require('flash').treesitter_search()
    end,
    desc = 'Treesitter Search',
  },
  {
    '<c-s>',
    mode = { 'c' },
    function()
      require('flash').toggle()
    end,
    desc = 'Toggle Flash Search',
  },
}

return Plugin
