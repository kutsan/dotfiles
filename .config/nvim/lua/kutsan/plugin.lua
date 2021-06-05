local plugin = {}

plugin.source = function()
  for _, mod in ipairs(vim.api.nvim_get_runtime_file('plugin/**/*.lua', true)) do
    local ok, msg = pcall(loadfile(mod))

    if not ok then
      print('Failed to load: ', mod)
      print('\t', msg)
    end
  end
end

return plugin
