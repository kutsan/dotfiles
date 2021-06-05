local api = vim.api

local utils = {}

function utils.map(mode, lhs, rhs, opts)
  api.nvim_set_keymap(mode, lhs, rhs, opts or {})
end

function utils.buf_map(...)
  api.nvim_buf_set_keymap(nil, ...)
end

return utils
