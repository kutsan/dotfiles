local Plugin = { 'akinsho/bufferline.nvim' }

Plugin.name = 'bufferline'
Plugin.version = '*'

Plugin.dependencies = {
  { 'nvim-tree/nvim-web-devicons', name = 'devicons' },
}

Plugin.event = 'VeryLazy'
Plugin.keys = {
  -- {
  --   '<leader>bp',
  --   '<Cmd>BufferLineTogglePin<CR>',
  --   desc = 'Toggle Pin',
  -- },
  -- {
  --   '<leader>bP',
  --   '<Cmd>BufferLineGroupClose ungrouped<CR>',
  --   desc = 'Delete Non-Pinned Buffers',
  -- },
  -- {
  --   '<leader>br',
  --   '<Cmd>BufferLineCloseRight<CR>',
  --   desc = 'Delete Buffers to the Right',
  -- },
  -- {
  --   '<leader>bl',
  --   '<Cmd>BufferLineCloseLeft<CR>',
  --   desc = 'Delete Buffers to the Left',
  -- },
  -- {
  --   '<S-h>',
  --   '<cmd>BufferLineCyclePrev<cr>',
  --   desc = 'Prev Buffer',
  -- },
  -- {
  --   '<S-l>',
  --   '<cmd>BufferLineCycleNext<cr>',
  --   desc = 'Next Buffer',
  -- },
  {
    '<M-p>',
    '<cmd>BufferLineCyclePrev<cr>',
    desc = 'Prev Buffer',
  },
  {
    '<M-n>',
    '<cmd>BufferLineCycleNext<cr>',
    desc = 'Next Buffer',
  },
  -- {
  --   '[B',
  --   '<cmd>BufferLineMovePrev<cr>',
  --   desc = 'Move buffer prev',
  -- },
  -- {
  --   ']B',
  --   '<cmd>BufferLineMoveNext<cr>',
  --   desc = 'Move buffer next',
  -- },
}

Plugin.opts = {
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
    offsets = {
      {
        filetype = 'snacks_layout_box',
        highlight = 'Directory',
      },
      {
        filetype = 'NvimTree',
      },
    },
    name_formatter = function(buf)
      local mark = require('grapple').exists({ buffer = buf.bufnr })
          and ' <U+F02E>'
        or ''
      return buf.name .. mark
    end,
    custom_areas = {
      right = function()
        local result = {}
        local severity = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, { severity = severity.ERROR })
        local warning = #vim.diagnostic.get(0, { severity = severity.WARN })
        local info = #vim.diagnostic.get(0, { severity = severity.INFO })
        local hint = #vim.diagnostic.get(0, { severity = severity.HINT })

        if error ~= 0 then
          table.insert(
            result,
            { text = '  ' .. error, link = 'DiagnosticError' }
          )
        end

        if warning ~= 0 then
          table.insert(
            result,
            { text = '  ' .. warning, link = 'DiagnosticWarn' }
          )
        end

        if hint ~= 0 then
          table.insert(
            result,
            { text = '  ' .. hint, link = 'DiagnosticHint' }
          )
        end

        if info ~= 0 then
          table.insert(
            result,
            { text = '  ' .. info, link = 'DiagnosticInfo' }
          )
        end

        return result
      end,
    },
  },
}

return Plugin
