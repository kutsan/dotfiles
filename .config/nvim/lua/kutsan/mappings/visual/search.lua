local fn = vim.fn
local cmd = vim.cmd
local api = vim.api

local function set_search()
  cmd(
    ('normal! %s'):format(api.nvim_replace_termcodes('<Esc>', true, true, true))
  )

  local visual_start_pos = fn.getpos("'<")[3]
  local visual_end_pos = fn.getpos("'>")[3]
  local selected_text = fn.getline("'<"):sub(visual_start_pos, visual_end_pos)

  fn.setreg('/', string.format('\\V%s', fn.escape(selected_text, '/\\')))
end

return { set_search = set_search }
