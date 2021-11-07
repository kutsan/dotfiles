local buf_map = require('kutsan/utils').buf_map
local popup = require('plenary/popup')
local fn = vim.fn
local cmd = vim.cmd

local function rename()
  local current_name = fn.expand('<cword>')

  local window = popup.create(current_name, {
    style = 'minimal',
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    relative = 'cursor',
    borderhighlight = 'FloatBorder',
    titlehighlight = 'Title',
    focusable = true,
    width = 30,
    height = 1,
    line = 'cursor+2',
    col = 'cursor-1',
  })

  cmd('startinsert!')

  buf_map('i', '<Esc>', '<Cmd>stopinsert <Bar> quit!<CR>', { silent = true })
  buf_map('n', '<Esc>', '<Cmd>quit!<CR>', { silent = true })
  buf_map(
    'i',
    '<CR>',
    ('<Cmd>stopinsert | lua _rename(\'"%s"\')<CR>'):format(current_name),
    {
      silent = true,
    }
  )
  buf_map(
    'n',
    '<CR>',
    ('<Cmd>stopinsert | lua _rename(\'"%s"\')<CR>'):format(current_name),
    {
      silent = true,
    }
  )

  function _G._rename(current)
    local new_name = vim.trim(fn.getline('.'))
    vim.api.nvim_win_close(window, true)

    local lsp_method = 'textDocument/rename'

    if #new_name > 0 and new_name ~= current then
      local params = vim.lsp.util.make_position_params()
      params.newName = new_name

      vim.lsp.buf_request(
        0,
        lsp_method,
        params,
        function(err, result, ctx, config)
          if err then
            vim.notify(
              ("Error running lsp query '%s': %s"):format(lsp_method, err),
              vim.log.levels.ERROR
            )
          end

          vim.lsp.handlers[lsp_method](err, result, ctx, config)
        end
      )
    end
  end
end

return { rename = rename }
