local Plugin = { 'neovim/nvim-lspconfig' }

Plugin.name = 'lspconfig'

Plugin.dependencies = {
  'cmp',
  {
    'williamboman/mason.nvim',
    name = 'mason',
    dependencies = {
      { 'Zeioth/mason-extra-cmds', name = 'mason-extra-cmds', opts = {} },
    },
  },
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

  api.nvim_create_autocmd('User', {
    pattern = 'LazyInstall',
    callback = function()
      vim.cmd.MasonUpdateAll()
    end,
  })

  diagnostic.config({
    severity_sort = true,
    float = {
      source = true,
      width = 80,
      border = 'single',
    },
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
    automatic_installation = true,
    ensure_installed = {
      'ts_ls',
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
          if client.server_capabilities.documentHighlightProvider then
            lsp.buf.document_highlight()
          end
        end,
      })

      api.nvim_create_autocmd('CursorMoved', {
        group = document_highlight_autocmd_group,
        buffer = 0,
        callback = function()
          if client.server_capabilities.documentHighlightProvider then
            lsp.buf.clear_references()
          end
        end,
      })
    end

    local map_opts = {
      buffer = true,
      silent = true,
    }

    if vim.lsp.inlay_hint then
      keymap.set('n', 'coi', function()
        lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled())
      end, map_opts)
    end

    vim.keymap.set('n', 'K', function()
      local width = math.floor(vim.o.columns * 0.8)
      local height = math.floor(vim.o.lines * 0.3)

      vim.lsp.handlers['textDocument/hover'] =
        vim.lsp.with(vim.lsp.handlers.hover, {
          border = 'rounded',
          max_width = width,
          max_height = height,
        })

      vim.lsp.buf.hover()
    end)

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
      diagnostic.open_float()
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

    ['ts_ls'] = function()
      local lsp_config = require('lspconfig')

      lsp_config.ts_ls.setup({
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
