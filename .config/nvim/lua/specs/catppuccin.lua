local Plugin = { 'catppuccin/nvim' }

Plugin.name = 'catppuccin'

Plugin.lazy = false
Plugin.priority = 1000

Plugin.opts = {
  flavour = 'mocha',
  term_colors = true,
  color_overrides = {
    mocha = {
      base = '#0f1119',
      mantle = '#090b10',
    },
  },
  highlight_overrides = {
    all = function(colors)
      local utils = require('catppuccin/utils/colors')

      return {
        -- Built-in highlights
        Whitespace = { fg = utils.darken(colors.surface0, 0.5, colors.base) },
        LspInlayHint = {
          fg = colors.overlay0,
          bg = 'NONE',
          style = { 'italic' },
        },
        Folded = { bg = utils.darken(colors.surface0, 0.8, colors.base) },
        DiffAdd = { bg = utils.darken(colors.green, 0.1, colors.base) },
        DiffChange = { bg = utils.darken(colors.blue, 0.1, colors.base) },
        DiffText = { bg = utils.darken(colors.blue, 0.3, colors.base) },
        DiffDelete = { bg = utils.darken(colors.red, 0.1, colors.base) },
        FloatBorder = {
          fg = utils.darken(colors.surface0, 0.3, colors.base),
          bg = utils.darken(colors.surface0, 0.3, colors.base),
        },
        NormalFloat = { bg = utils.darken(colors.surface0, 0.3, colors.base) },

        -- treesitter: TypeScript with JSX
        ['@constructor.tsx'] = { fg = colors.yellow },
        ['@tag.tsx'] = { fg = colors.red },

        -- treesitter: SCSS
        ['@string.scss'] = { fg = colors.orange },
        ['@type.definition.scss'] = { fg = colors.blue },
        ['@property.scss'] = { fg = colors.text },
        ['@property.id.scss'] = { fg = colors.blue },
        ['@property.class.scss'] = { fg = colors.red },
        ['@type.scss'] = { fg = colors.orange },
        ['@type.tag.scss'] = { fg = colors.mauve },
        ['@string.plain.scss'] = { fg = colors.peach },
        ['@number.scss'] = { fg = colors.peach },

        -- treesitter-context
        TreesitterContext = {
          bg = utils.darken(colors.surface0, 0.2, colors.base),
        },
        TreesitterContextLineNumber = {
          bg = utils.darken(colors.surface0, 0.2, colors.base),
          fg = colors.overlay0,
        },

        -- nvim-tree
        NvimTreeIndentMarker = {
          fg = utils.darken(colors.surface0, 0.3, colors.base),
        },

        -- telescope
        TelescopeNormal = {
          bg = utils.darken(colors.surface0, 0.15, colors.base),
        },
        TelescopeBorder = {
          fg = utils.darken(colors.surface0, 0.15, colors.base),
          bg = utils.darken(colors.surface0, 0.15, colors.base),
        },
      }
    end,
  },
  integrations = {
    diffview = true,
    treesitter = true,
    treesitter_context = true,
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'undercurl' },
        hints = { 'undercurl' },
        warnings = { 'undercurl' },
        information = { 'undercurl' },
      },
    },
  },
}

Plugin.config = function(_, opts)
  local catppuccin = require('catppuccin')
  catppuccin.setup(opts)

  vim.cmd.colorscheme('catppuccin')
end

return Plugin
