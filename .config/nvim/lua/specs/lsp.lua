local Plugin = { 'neovim/nvim-lspconfig' }

Plugin.name = 'lspconfig'

Plugin.dependencies = {
  'cmp',
  { 'williamboman/mason.nvim', name = 'mason' },
  { 'williamboman/mason-lspconfig.nvim', name = 'mason-lspconfig' },
  { 'b0o/SchemaStore.nvim', name = 'schema-store' },
}

Plugin.config = function()
  local mason = require('mason')
  local mason_lsp_config = require('mason-lspconfig')
  local cmp_lsp = require('cmp_nvim_lsp')

  local fn = vim.fn
  local diagnostic = vim.diagnostic
  local lsp = vim.lsp
  local keymap = vim.keymap
  local api = vim.api

  diagnostic.config({
    severity_sort = true,
  })

  local sign_char = '•' -- U+2022 BULLET
  fn.sign_define('DiagnosticSignError', {
    text = sign_char,
    texthl = 'DiagnosticSignError',
  })
  fn.sign_define('DiagnosticSignWarn', {
    text = sign_char,
    texthl = 'DiagnosticSignWarn',
  })
  fn.sign_define('DiagnosticSignInfo', {
    text = sign_char,
    texthl = 'DiagnosticSignInfo',
  })
  fn.sign_define('DiagnosticSignHint', {
    text = sign_char,
    texthl = 'DiagnosticSignHint',
  })

  mason.setup()
  mason_lsp_config.setup({
    ensure_installed = {
      'tsserver',
      'eslint',
      'html',
      'cssls',
      'cssmodules_ls',
      'stylelint_lsp',
      'jsonls',
      'lua_ls',
      'typos_lsp',
    },
  })

  local function on_attach(client)
    if client.server_capabilities.documentHighlightProvider then
      local document_highlight_autocmd_group =
        api.nvim_create_augroup('DocumentHighlight', { clear = true })

      api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = document_highlight_autocmd_group,
        buffer = 0,
        callback = function()
          if not client.server_capabilities.documentHighlightProvider then
            return true
          end

          lsp.buf.document_highlight()
        end,
      })

      api.nvim_create_autocmd('CursorMoved', {
        group = document_highlight_autocmd_group,
        buffer = 0,
        callback = function()
          if not client.server_capabilities.documentHighlightProvider then
            return true
          end

          lsp.buf.clear_references()
        end,
      })
    end

    local map_opts = {
      buffer = true,
      silent = true,
    }

    local floating_windows_width = 80

    if vim.lsp.inlay_hint then
      keymap.set('n', 'coi', function()
        lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled())
      end, map_opts)
    end

    keymap.set('n', 'gd', function()
      lsp.buf.definition()
    end, map_opts)

    keymap.set('n', 'gD', function()
      lsp.buf.declaration()
    end, map_opts)

    keymap.set('n', 'gt', function()
      lsp.buf.type_definition()
    end, map_opts)

    keymap.set('n', 'gr', function()
      lsp.buf.references()
    end, map_opts)

    keymap.set('n', 'gi', function()
      lsp.buf.implementation()
    end, map_opts)

    keymap.set('n', '<Space>c*', function()
      lsp.buf.rename()
    end, map_opts)

    keymap.set('n', 'gx', function()
      lsp.buf.code_action()
    end, map_opts)

    keymap.set({ 'n', 'x' }, '\\f', function()
      if client.server_capabilities.documentFormattingProvider then
        vim.lsp.buf.format()
      end

      require('conform').format()
    end, map_opts)

    keymap.set('n', 'J', function()
      diagnostic.open_float({
        source = true,
        scope = 'line',
        width = floating_windows_width,
      })
    end, map_opts)
  end

  local capabilities = cmp_lsp.default_capabilities()

  mason_lsp_config.setup_handlers({
    function(server_name)
      local lsp_config = require('lspconfig')

      lsp_config[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,

    ['tsserver'] = function()
      local lsp_config = require('lspconfig')

      lsp_config.tsserver.setup({
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false

          on_attach(client)
        end,
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })
    end,

    ['lua_ls'] = function()
      local lsp_config = require('lspconfig')

      lsp_config.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        on_init = function(client)
          local path = client.workspace_folders[1].name

          -- Skip if .luarc.json or .luarc.jsonc exists.
          if
            vim.uv.fs_stat(path .. '/.luarc.json')
            or vim.uv.fs_stat(path .. '/.luarc.jsonc')
          then
            return
          end

          client.config.settings.Lua =
            vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                version = 'LuaJIT',
              },
              telemetry = { enable = false },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
            })
        end,
        settings = {
          Lua = {},
        },
      })
    end,

    ['jsonls'] = function()
      local lsp_config = require('lspconfig')

      lsp_config.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
          },
        },
      })
    end,

    ['stylelint_lsp'] = function()
      local lsp_config = require('lspconfig')

      lsp_config.stylelint_lsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
          'css',
          'scss',
        },
        settings = {
          stylelintplus = {
            autoFixOnFormat = true,
          },
        },
      })
    end,

    ['typos_lsp'] = function()
      local lsp_config = require('lspconfig')

      lsp_config.typos_lsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = {
          diagnosticSeverity = 'Hint',
        },
      })
    end,
  })
end

return Plugin
