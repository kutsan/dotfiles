local ftplugin = {}

ftplugin.find_lua_ftplugins = function(filetype)
  local patterns = {
    string.format('ftplugin/%s.lua', filetype),
  }

  local result = {}
  for _, pat in ipairs(patterns) do
    vim.list_extend(result, vim.api.nvim_get_runtime_file(pat, true))
  end

  return result
end

ftplugin.do_filetype = function(filetype)
  local ftplugins = ftplugin.find_lua_ftplugins(filetype)

  local f_env = setmetatable({
    print = vim.schedule_wrap(print),
  }, {
    __index = _G,
    __newindex = _G,
  })

  for _, file in ipairs(ftplugins) do
    local f = loadfile(file)
    if not f then
      vim.api.nvim_err_writeln('Unable to load file: ' .. file)
    else
      local ok, msg = pcall(setfenv(f, f_env))

      if not ok then
        vim.api.nvim_err_writeln(
          'Error while processing file: ' .. file .. '\n' .. msg
        )
      end
    end
  end
end

return ftplugin
