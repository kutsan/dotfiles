local api = vim.api
local fn = vim.fn
local cmd = vim.cmd
local lsp = vim.lsp
local keymap = vim.keymap

local function open_rename_window()
  local current_name = fn.expand('<cword>')

  local buffer = api.nvim_create_buf(false, true)
  api.nvim_buf_set_lines(buffer, 0, -1, true, { current_name })

  local window = api.nvim_open_win(buffer, true, {
    relative = 'cursor',
    border = 'rounded',
    focusable = true,
    width = 30,
    height = 1,
    col = 0,
    row = 1,
    style = 'minimal',
  })

  cmd('startinsert!')

  keymap.set('i', '<Esc>', '<Cmd>stopinsert <Bar> quit!<CR>', { buffer = true, silent = true })
  keymap.set('n', '<Esc>', '<Cmd>quit!<CR>', { buffer = true, silent = true })
  keymap.set(
    'i',
    '<CR>',
    ('<Cmd>stopinsert | lua require("kutsan/mappings/normal/rename").rename_symbol_from_window(%d, "%s")<CR>'):format(
      window,
      current_name
    ),
    {
      buffer = true,
      silent = true,
    }
  )
  keymap.set(
    'n',
    '<CR>',
    ('<Cmd>stopinsert | lua require("kutsan/mappings/normal/rename").rename_symbol_from_window(%d, "%s")<CR>'):format(
      window,
      current_name
    ),
    {
      buffer = true,
      silent = true,
    }
  )
end

local function rename_symbol_from_window(window, current_name)
  local new_name = vim.trim(api.nvim_get_current_line())
  api.nvim_win_close(window, true)

  local lsp_method = 'textDocument/rename'

  if #new_name > 0 and new_name ~= current_name then
    local params = lsp.util.make_position_params()
    params.newName = new_name

    lsp.buf_request(0, lsp_method, params, function(err, result, ctx, config)
      if err then
        vim.notify(
          ("Error running lsp query '%s': %s"):format(lsp_method, err),
          vim.log.levels.ERROR
        )
      end

      lsp.handlers[lsp_method](err, result, ctx, config)
    end)
  end
end

return {
  open_rename_window = open_rename_window,
  rename_symbol_from_window = rename_symbol_from_window,
}
