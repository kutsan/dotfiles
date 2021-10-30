local bufferline = require('bufferline')

bufferline.setup({
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
    enforce_regular_tabs = true,
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function()
      return ' •'
    end,
    offsets = {
      {
        filetype = 'NvimTree',
      },
    },
  },
})
