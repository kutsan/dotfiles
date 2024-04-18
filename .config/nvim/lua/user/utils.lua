local b = vim.b

local function set_undo_ftplugin(cmd)
  local undo_cmd = cmd

  if b.undo_ftplugin ~= nil then
    undo_cmd = b.undo_ftplugin .. ' | ' .. undo_cmd
  end

  b.undo_ftplugin = undo_cmd
end

return { set_undo_ftplugin = set_undo_ftplugin }
