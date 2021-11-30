local api = vim.api
local fn = vim.fn
local cmd = vim.cmd

local function bufremove(opts)
  local target_buf_id = api.nvim_get_current_buf()

  -- Do nothing if buffer is in modified state.
  if not opts.force and api.nvim_buf_get_option(target_buf_id, 'modified') then
    return false
  end

  -- Hide target buffer from all windows.
  vim.tbl_map(function(win_id)
    win_id = win_id or 0

    local current_buf_id = api.nvim_win_get_buf(win_id)

    api.nvim_win_call(win_id, function()
      -- Try using alternate buffer
      local alt_buf_id = fn.bufnr('#')
      if alt_buf_id ~= current_buf_id and fn.buflisted(alt_buf_id) == 1 then
        api.nvim_win_set_buf(win_id, alt_buf_id)
        return
      end

      -- Try using previous buffer
      cmd('bprevious')
      if current_buf_id ~= api.nvim_win_get_buf(win_id) then
        return
      end

      -- Create new listed scratch buffer
      local new_buf = api.nvim_create_buf(true, true)
      api.nvim_win_set_buf(win_id, new_buf)
    end)

    return true
  end, fn.win_findbuf(target_buf_id))

  cmd(string.format('bdelete%s %d', opts.force and '!' or '', target_buf_id))
end

return { bufremove = bufremove }
