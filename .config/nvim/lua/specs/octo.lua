local Plugin = { 'pwntester/octo.nvim' }

Plugin.name = 'octo'

Plugin.dependencies = {
  { 'nvim-lua/plenary.nvim', name = 'plenary' },
  { 'nvim-telescope/telescope.nvim', name = 'telescope' },
  { 'nvim-tree/nvim-web-devicons', name = 'devicons' },
}

Plugin.opts = {
  ssh_aliases = { ['github'] = 'github.com' },
  suppress_missing_scope = {
    projects_v2 = true,
  },
}

return Plugin
