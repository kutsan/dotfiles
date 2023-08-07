local devicons = require('nvim-web-devicons')

-- Set devicons overrides early.
devicons.setup({
  override = {
    js = { icon = '󰌞', color = '#f5c06f', name = 'Js' },
    jsx = { icon = '', color = '#689fb6', name = 'Jsx' },
    ts = { icon = '󰛦', color = '#4377c1', name = 'Ts' },
    tsx = { icon = '', color = '#4377c1', name = 'Tsx' },
    png = { icon = '󰋩', color = '#d4843e', name = 'Png' },
    webp = { icon = '󰋩', color = '#3498db', name = 'Webp' },
    jpg = { icon = '󰋩', color = '#16a085', name = 'Jpg' },
    svg = { icon = '󰋩', color = '#3affdb', name = 'Svg' },
  },
})
