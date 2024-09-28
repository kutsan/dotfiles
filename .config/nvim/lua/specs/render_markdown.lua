local Plugin = { 'MeanderingProgrammer/render-markdown.nvim' }

Plugin.name = 'render-markdown'

Plugin.opts = {}

Plugin.dependencies = {
  { 'nvim-treesitter/nvim-treesitter', name = 'treesitter' },
  { 'nvim-tree/nvim-web-devicons', name = 'devicons' },
}

return Plugin
