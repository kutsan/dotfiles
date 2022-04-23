local lspconfig = require('lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp')

local cmd = vim.cmd
local fn = vim.fn
local env = vim.env
local split = vim.split
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local keymap = vim.keymap

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

local function handle_attach(client)
  if client.resolved_capabilities.document_highlight then
    cmd('autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
    cmd('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
    cmd('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
  end

  local map_opts = {
    buffer = true,
    silent = true,
  }

  keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
  keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', map_opts)
  keymap.set('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', map_opts)
  keymap.set('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', map_opts)
  keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
  keymap.set('n', 'gx', '<Cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
  keymap.set('n', '\\f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', map_opts)
  keymap.set(
    'n',
    'J',
    '<Cmd>lua vim.diagnostic.open_float(0, { source = "always", scope = "line", header = false, width = 55 })<CR>',
    map_opts
  )
  keymap.set(
    'n',
    '[g',
    '<Cmd>lua vim.diagnostic.goto_prev({ float = { source = "always", width = 55 }})<CR>',
    map_opts
  )
  keymap.set(
    'n',
    ']g',
    '<Cmd>lua vim.diagnostic.goto_next({ float = { source = "always", width = 55 }})<CR>',
    map_opts
  )
  keymap.set('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', map_opts)
end

local capabilities = cmp_capabilities.update_capabilities(
  lsp.protocol.make_client_capabilities()
)

lspconfig.tsserver.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    handle_attach(client)
  end,
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
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    handle_attach(client)
  end,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})
lspconfig.sumneko_lua.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
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

local null_ls = require('null-ls')

null_ls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
  diagnostics_format = '#{m} [#{c}]',
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.stylelint.with({
      command = 'node_modules/.bin/stylelint',
    }),

    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.luacheck,

    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.code_actions.gitsigns,
  },
})
