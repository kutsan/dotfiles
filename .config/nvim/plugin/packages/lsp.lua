local lspconfig = require('lspconfig')
local buf_map = require('kutsan.utils').buf_map
local cmd = vim.cmd
local lsp = vim.lsp
local fn = vim.fn
local env = vim.env
local split = vim.split

lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
  }
)

fn.sign_define('LspDiagnosticsSignError', { text = '•' })
fn.sign_define('LspDiagnosticsSignWarning', { text = '•' })
fn.sign_define('LspDiagnosticsSignInformation', { text = '•' })
fn.sign_define('LspDiagnosticsSignHint', { text = '•' })

local function on_attach()
  local opts = {
    noremap = true,
    silent = true,
  }

  cmd('autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
  cmd('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
  cmd('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')

  buf_map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_map('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_map('n', '<Space>c*', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_map(
    'n',
    'J',
    '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })<CR>',
    opts
  )
  buf_map('n', '[g', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_map('n', ']g', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_map('n', '<C-f>', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_map('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

lspconfig.tsserver.setup({ on_attach = on_attach })
lspconfig.cssls.setup({ on_attach = on_attach })
lspconfig.html.setup({ on_attach = on_attach })
lspconfig.jsonls.setup({ on_attach = on_attach })

lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
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
  on_attach = on_attach,
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
