local Plugin = { 'mason-org/mason-lspconfig.nvim' }

Plugin.name = 'mason-lspconfig'

Plugin.dependencies = { 'mason', 'lspconfig' }

Plugin.opts = {
  ensure_installed = {
    'ts_ls',
    'eslint',
    'html',
    'cssls',
    'cssmodules_ls',
    'stylelint_lsp',
    'jsonls',
    'yamlls',
    'lua_ls',
    'vimls',
    'typos_lsp',
    'taplo',
    'dockerls',
    'docker_compose_language_service',
  },
}

return Plugin
