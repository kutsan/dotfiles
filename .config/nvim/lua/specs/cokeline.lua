local Plugin = { 'willothy/nvim-cokeline' }

Plugin.name = 'cokeline'
Plugin.version = '*'

Plugin.dependencies = {
  { 'nvim-lua/plenary.nvim', name = 'plenary' },
  'devicons',
}

Plugin.config = function()
  local cokeline = require('cokeline')
  local get_hex = require('cokeline/utils').get_hex

  cokeline.setup({
    default_hl = {
      fg = function(buffer)
        return buffer.is_focused and get_hex('Normal', 'fg')
          or get_hex('Comment', 'fg')
      end,
      bg = function(buffer)
        return buffer.is_focused and get_hex('ColorColumn', 'bg')
          or get_hex('Normal', 'bg')
      end,
    },
    rendering = { max_buffer_width = 25 },

    sidebar = {
      filetype = { 'NvimTree' },
      components = {
        {
          text = '',
          bg = function()
            return get_hex('NvimTreeNormal', 'bg')
          end,
        },
      },
    },

    components = {
      {
        text = function(buffer)
          return buffer.is_focused and '▎' or ' '
        end,
      },
      {
        text = ' ',
      },
      {
        text = function(buffer)
          return buffer.devicon.icon
        end,
        fg = function(buffer)
          return buffer.devicon.color
        end,
      },
      {
        text = ' ',
      },
      {
        text = function(buffer)
          return buffer.unique_prefix
        end,
        fg = get_hex('Comment', 'fg'),
        italic = true,
      },
      {
        text = function(buffer)
          return buffer.filename .. '  '
        end,
        bold = function(buffer)
          return buffer.is_focused
        end,
        truncation = {
          direction = 'middle',
        },
      },
    },
  })
end

return Plugin
