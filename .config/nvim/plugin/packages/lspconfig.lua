local lspconfig = require('lspconfig')
local buf_map = require('kutsan/utils').buf_map
local cmp_capabilities = require('cmp_nvim_lsp')

local cmd = vim.cmd
local fn = vim.fn
local env = vim.env
local split = vim.split
local diagnostic = vim.diagnostic
local lsp = vim.lsp

diagnostic.config({
  update_in_insert = false,
  virtual_text = false,
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

local function handle_attach()
  local opts = { silent = true }

  cmd('autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
  cmd('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
  cmd('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')

  buf_map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_map('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_map(
    'n',
    'J',
    '<Cmd>lua vim.diagnostic.open_float(0, { scope = "line", header = false, width = 55 })<CR>',
    opts
  )
  buf_map(
    'n',
    '[g',
    '<Cmd>lua vim.diagnostic.goto_prev({ float = { width = 55 }})<CR>',
    opts
  )
  buf_map(
    'n',
    ']g',
    '<Cmd>lua vim.diagnostic.goto_next({ float = { width = 55 }})<CR>',
    opts
  )
  buf_map('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

local capabilities =
  cmp_capabilities.update_capabilities(lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
})
lspconfig.cssls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
})
lspconfig.html.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
})
lspconfig.jsonls.setup({
  capabilities = capabilities,
})

lspconfig.sumneko_lua.setup({
  on_attach = handle_attach,
  cmd = {
    string.format(
      '%s/.local/lib/lua-language-server/bin/%s/lua-language-server',
      env.HOME,
      fn.has('mac') == 1 and 'macOS' or 'Linux'
    ),
    '-E',
    string.format('%s/.local/lib/lua-language-server/main.lua', env.HOME),
  },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [fn.expand('$VIMRUNTIME/lua')] = true,
          [fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = { enable = false },
    },
  },
})

lspconfig.diagnosticls.setup({
  on_attach = handle_attach,
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'lua',
  },
  init_options = {
    filetypes = {
      javascript = 'eslint',
      typescript = 'eslint',
      javascriptreact = 'eslint',
      typescriptreact = 'eslint',
      lua = 'luacheck',
    },
    linters = {
      eslint = {
        sourceName = 'eslint',
        command = 'eslint_d',
        rootPatterns = {
          '.git',
          '.eslitrc.js',
          'package.json',
        },
        debounce = 500,
        args = {
          '--cache',
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json',
        },
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
          security = 'severity',
        },
        securities = {
          ['2'] = 'error',
          ['1'] = 'warning',
        },
      },

      luacheck = {
        command = 'luacheck',
        args = {
          '--formatter',
          'plain',
          '--ranges',
          '--filename',
          '%filepath',
          '-',
        },
        sourceName = 'luacheck',
        formatPattern = {
          '^[^:]+:(\\d+):(\\d+)-(\\d+):\\s+\\((\\w)\\d+\\)\\s+(.*)$',
          {
            line = 1,
            column = 2,
            endLine = 1,
            endColumn = 3,
            security = 4,
            message = 5,
          },
        },
        rootPatterns = { '.luacheckrc' },
        requiredFiles = { '.luacheckrc' },
        debounce = 100,
        securities = {
          E = 'error',
          W = 'warning',
        },
      },
    },
  },
})
