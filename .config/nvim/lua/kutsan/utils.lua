local api = vim.api
local b = vim.b

local function map(mode, lhs, rhs, opts_overrides)
  local opts = { noremap = true }

  for key, value in pairs(opts_overrides or {}) do
    opts[key] = value
  end

  api.nvim_set_keymap(mode, lhs, rhs, opts)
end

local function buf_map(mode, lhs, rhs, opts_overrides)
  local opts = { noremap = true }

  for key, value in pairs(opts_overrides or {}) do
    opts[key] = value
  end

  api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
end

local function set_undo_ftplugin(cmd)
  local undo_cmd = cmd

  if b.undo_ftplugin ~= nil then
    undo_cmd = b.undo_ftplugin .. ' | ' .. undo_cmd
  end

  b.undo_ftplugin = undo_cmd
end

return {
  map = map,
  buf_map = buf_map,
  set_undo_ftplugin = set_undo_ftplugin,
}
