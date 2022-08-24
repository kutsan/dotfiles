local surround = require('nvim-surround')

surround.setup({
  keymaps = {
    normal = 'sa',
    visual = 'sa',
    delete = 'sd',
    change = 'sr',
    insert = false,
    insert_line = false,
  },
})
