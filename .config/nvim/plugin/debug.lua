local tbl_map = vim.tbl_map

local function inspect(...)
  local objects = tbl_map(vim.inspect, { ... })

  print(unpack(objects))
end

_G.inspect = inspect
