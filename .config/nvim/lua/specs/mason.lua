local Plugin = { 'mason-org/mason.nvim' }

Plugin.name = 'mason'

Plugin.optional = true
Plugin.dependencies = { 'mason-extra-cmds' }
Plugin.opts = {}

Plugin.config = function(_, opts)
  local mason = require('mason')

  mason.setup(opts)

  vim.api.nvim_create_autocmd('User', {
    pattern = 'LazyInstall',
    callback = function()
      vim.cmd.MasonUpdateAll()
    end,
  })
end

return Plugin
