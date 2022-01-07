local api = vim.api
local fn = vim.fn

local function bufnr_calc_width(buf, lines)
  return api.nvim_buf_call(buf, function()
    local width = 0

    for _, l in ipairs(lines) do
      local len = vim.fn.strdisplaywidth(l)
      if len > width then
        width = len
      end
    end

    return width + 1
  end)
end

local function get_current_syntax_group()
  local line_number = fn.line('.')
  local column_position = fn.col('.')

  local syntax_id = fn.synID(line_number, column_position, true)
  local highlight = fn.synIDattr(syntax_id, 'name')

  local syntax_id_2 = fn.synID(line_number, column_position, false)
  local trans = fn.synIDattr(syntax_id_2, 'name')

  local syntax_id_3 = fn.synIDtrans(syntax_id)
  local lo = fn.synIDattr(syntax_id_3, 'name')

  return {
    ('hi    → %s'):format(highlight or nil),
    ('trans → %s'):format(trans or nil),
    ('lo    → %s'):format(lo or nil),
  }
end

local function reveal_syntax_group()
  local buffer = api.nvim_create_buf(false, true)
  local lines = get_current_syntax_group()
  api.nvim_buf_set_lines(buffer, 0, -1, true, lines)

  local window = api.nvim_open_win(buffer, false, {
    relative = 'cursor',
    border = 'rounded',
    focusable = true,
    width = bufnr_calc_width(buffer, lines),
    height = 3,
    col = 0,
    row = 1,
    anchor = 'NW',
    style = 'minimal',
  })

  vim.cmd(('augroup reveal_syntax_group_%s'):format(window))
  vim.cmd(
    'autocmd CursorMoved,CursorMovedI * '
      .. ("lua require('kutsan/mappings/normal/syntax').close_window(%d)"):format(
        window
      )
  )
  vim.cmd('augroup end')
end

local function close_window(win_id)
  if api.nvim_get_current_win() ~= win_id then
    vim.cmd(('silent! augroup! reveal_syntax_group_%s'):format(win_id))

    pcall(api.nvim_win_close, win_id, true)
  end
end

return {
  reveal_syntax_group = reveal_syntax_group,
  close_window = close_window,
}
