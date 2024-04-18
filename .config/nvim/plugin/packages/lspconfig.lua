local fn = vim.fn
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local keymap = vim.keymap
local api = vim.api

local mason = require('mason')
local mason_lsp_config = require('mason-lspconfig')
local cmp_lsp = require('cmp_nvim_lsp')

diagnostic.config({
  virtual_text = false,
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

local capabilities = cmp_lsp.default_capabilities()

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

local function handle_attach(client)
  if client.server_capabilities.documentHighlightProvider then
    local document_highlight_group =
        api.nvim_create_augroup('DocumentHighlight', { clear = true })

    api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = document_highlight_group,
      buffer = 0,
      callback = function()
        lsp.buf.document_highlight()
      end,
    })

    api.nvim_create_autocmd('CursorMoved', {
      group = document_highlight_group,
      buffer = 0,
      callback = function()
        lsp.buf.clear_references()
      end,
    })
  end

  local map_opts = {
    buffer = true,
    silent = true,
  }

  local floating_windows_width = 80

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

  keymap.set('n', 'K', function()
    lsp.buf.hover()
  end, map_opts)

  keymap.set('n', 'gx', function()
    lsp.buf.code_action()
  end, map_opts)

  keymap.set('n', '\\f', function()
    vim.lsp.buf.format({
      filter = function(server)
        return server.name ~= 'tsserver'
      end,
    })
  end, map_opts)

  keymap.set('i', '<C-k>', function()
    lsp.buf.signature_help()
  end, map_opts)

  keymap.set('n', 'J', function()
    diagnostic.open_float(0, {
      source = 'always',
      scope = 'line',
      header = false,
      width = floating_windows_width,
    })
  end, map_opts)

  keymap.set('n', '[g', function()
    diagnostic.goto_prev({
      float = {
        source = true,
        width = floating_windows_width,
      },
    })
  end, map_opts)

  keymap.set('n', ']g', function()
    diagnostic.goto_next({
      float = {
        source = true,
        width = floating_windows_width,
      },
    })
  end, map_opts)
end

mason_lsp_config.setup_handlers({
  function(server_name)
    local lsp_config = require('lspconfig')

    lsp_config[server_name].setup({
      on_attach = handle_attach,
      capabilities = capabilities,
    })
  end,

  ['lua_ls'] = function()
    local lsp_config = require('lspconfig')

    lsp_config.lua_ls.setup({
      capabilities = capabilities,
      on_attach = handle_attach,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,

  ['jsonls'] = function()
    local lsp_config = require('lspconfig')

    lsp_config.jsonls.setup({
      capabilities = capabilities,
      on_attach = handle_attach,
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
      on_attach = handle_attach,
      settings = {
        stylelintplus = {
          autoFixOnFormat = true,
        }
      },
    })
  end,
})
