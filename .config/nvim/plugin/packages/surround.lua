local surround = require('nvim-surround')

surround.setup({
  keymaps = {
    insert = 'sa',
    visual = 'sa',
    delete = 'sd',
    change = 'sr',
    insert_line = false,
  },
})
