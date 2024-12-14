local Plugin = { 'brenoprata10/nvim-highlight-colors' }

Plugin.name = 'highlight-colors'

Plugin.opts = {
  render = 'virtual',
  virtual_symbol = '',
  names = false,
  rgb_fn = true,
  hsl_fn = true,
}

return Plugin
