local compe = require('compe')

compe.setup({
  preselect = 'always',
  documentation = false,
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true
  }
})
