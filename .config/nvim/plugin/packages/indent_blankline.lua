local indent_blankline = require('indent_blankline')

indent_blankline.setup({
  buftype_exclude = { 'terminal', 'nofile' },
  filetype_exclude = { 'help', 'man' },
})
