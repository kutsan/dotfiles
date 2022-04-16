local devicons = require('nvim-web-devicons')
local g = vim.g

-- Enable Lua filetype detection.
g.do_filetype_lua = 1

-- Disable unused built-in plugins.
g.loaded_gzip = true
g.loaded_rrhelper = true
g.loaded_tarPlugin = true
g.loaded_zipPlugin = true
g.loaded_netrwPlugin = true
g.loaded_netrwFileHandlers = true
g.loaded_netrwSettings = true
g.loaded_2html_plugin = true
g.loaded_vimballPlugin = true
g.loaded_getscriptPlugin = true
g.loaded_logipat = true
g.loaded_tutor_mode_plugin = true
g.loaded_matchit = true

-- Set devicons overrides early.
devicons.setup({
  override = {
    html = { icon = '', color = '#e67e22', name = 'Html' },
    css = { icon = '', color = '#689fb6', name = 'Css' },
    js = { icon = '', color = '#f5c06f', name = 'Js' },
    jsx = { icon = '', color = '#689fb6', name = 'Jsx' },
    md = { icon = '', color = '#44788e', name = 'Md' },
    png = { icon = '', color = '#d4843e', name = 'Png' },
    webp = { icon = '', color = '#3498db', name = 'Webp' },
    jpg = { icon = '', color = '#16a085', name = 'Jpg' },
    svg = { icon = '', color = '#3affdb', name = 'Svg' },
    LICENSE = { icon = '', color = '#f1f1f1', name = 'License' },
  },
})
