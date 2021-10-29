local map = require('kutsan/utils').map
local compe = require('compe')

compe.setup({
  preselect = 'always',
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
  },
})

map('i', '<C-Space>', 'compe#complete()', { expr = true, silent = true })
