local api = vim.api
local b = vim.b

local utils = {}

function utils.map(mode, lhs, rhs, opts)
  api.nvim_set_keymap(mode, lhs, rhs, opts or {})
end

function utils.buf_map(...)
  api.nvim_buf_set_keymap(nil, ...)
end

function utils.set_undo_ftplugin(cmd)
  local undo_cmd = cmd

  if b.undo_ftplugin ~= nil then
    undo_cmd = b.undo_ftplugin .. ' | ' .. undo_cmd
  end

  b.undo_ftplugin = undo_cmd
end

return utils
