local treesitter = require('nvim-treesitter.configs')
local treesitter_context = require('treesitter-context')

treesitter.setup({
  sync_install = false,
  auto_install = true,
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    use_languagetree = true,
  },
})

treesitter_context.setup({
  max_lines = 1,
})
