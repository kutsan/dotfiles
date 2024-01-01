local catppuccin = require('catppuccin')

catppuccin.setup({
  flavour = 'mocha',
  no_bold = true,
  term_colors = true,
  color_overrides = {
    mocha = {
      base = '#0f1119',
      mantle = '#090b10',
    },
  },
  highlight_overrides = {
    all = function(colors)
      return {
        ['NvimTreeIndentMarker'] = { fg = '#232637' },
        -- treesitter
        ['@constructor.tsx'] = { fg = colors.yellow },
        ['@tag.tsx'] = { fg = colors.red },
        ['@string.scss'] = { fg = colors.orange },
        ['@type.definition.scss'] = { fg = colors.blue },
        -- SCSS
        ['@property.scss'] = { fg = colors.text },
        ['@property.id.scss'] = { fg = colors.blue },
        ['@property.class.scss'] = { fg = colors.red },
        ['@type.scss'] = { fg = colors.orange },
        ['@type.tag.scss'] = { fg = colors.mauve },
        ['@string.plain.scss'] = { fg = colors.peach },
        ['@number.scss'] = { fg = colors.peach },
        -- treesitter-context
        ['TreesitterContext'] = {
          bg = '#1d2030',
        },
        ['TreesitterContextLineNumber'] = {
          bg = '#1d2030',
          fg = colors.overlay0,
        },
        ['TreesitterContextBottom'] = {
          style = {},
        },
      }
    end,
  },
  integrations = {
    treesitter = true,
    treesitter_context = true,
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    indent_blankline = {
      enabled = true,
      scope_color = 'surface2',
    },
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
})
