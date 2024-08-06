local Plugin = { 'stevearc/conform.nvim' }

Plugin.name = 'conform'

Plugin.opts = {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    yaml = { 'prettierd' },
    json = { 'prettierd' },
  },
}

return Plugin
