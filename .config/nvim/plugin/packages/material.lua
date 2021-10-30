local g = vim.g
local material = require('material')

g.material_style = 'deep ocean'
local colors = require('material/colors')

material.setup({
  italics = {
    comments = true,
  },
  disable = {
    term_colors = true,
  },
  custom_highlights = {
    -- Common
    Identifier = { fg = colors.cyan },
    Todo = { fg = colors.yellow, style = 'bold' },
    DiffAdd = { bg = '#45493e', fg = colors.none },
    DiffChange = { bg = '#384851', fg = colors.none },
    DiffDelete = { bg = colors.none, fg = colors.selection },
    DiffText = { bg = '#5b7881', fg = colors.none },
    MatchParen = { fg = colors.comments, bg = colors.cyan },
    Search = { fg = colors.white, bg = colors.comments },
    IncSearch = { fg = colors.white, bg = colors.comments },
    StatusLine = { fg = colors.comments, bg = colors.bg },
    StatusLineNC = { fg = colors.selection, bg = colors.bg },
    LspReferenceText = { fg = colors.none, bg = '#1F2233' },
    LspReferenceRead = { fg = colors.none, bg = '#1F2233' },
    LspReferenceWrite = { fg = colors.none, bg = '#1F2233' },

    -- NvimTree
    NvimTreeIndentMarker = { fg = colors.selection },
    NvimTreeNormal = { bg = colors.contrast },
    NvimTreeFolderIcon = {},

    -- CSS
    cssAttrComma = { fg = colors.fg },
    cssPseudoClassId = { fg = colors.yellow },
    cssBraces = { fg = colors.fg },
    cssClassName = { fg = colors.yellow },
    cssClassNameDot = { fg = colors.yellow },
    cssFunctionName = { fg = colors.blue },
    cssImportant = { fg = colors.cyan },
    cssIncludeKeyword = { fg = colors.purple },
    cssTagName = { fg = colors.red },
    cssMediaType = { fg = colors.orange },
    cssProp = { fg = colors.fg },
    cssSelectorOp = { fg = colors.cyan },
    cssSelectorOp2 = { fg = colors.cyan },
    cssAttr = { fg = colors.orange },

    -- JavaScript
    javaScriptBraces = { fg = colors.fg },
    javaScriptNull = { fg = colors.orange },
    javaScriptIdentifier = { fg = colors.purple },
    javaScriptNumber = { fg = colors.orange },
    javaScriptRequire = { fg = colors.cyan },
    javaScriptReserved = { fg = colors.purple },

    -- TypeScript
    typescriptVariable = { fg = colors.purple },
    typescriptImport = { fg = colors.cyan },
    typescriptExport = { fg = colors.cyan },

    -- JSX
    jsxTag = { fg = colors.cyan },
    jsxTagName = { fg = colors.pink },
    jsxComponentName = { fg = colors.yellow },
    jsxCloseTag = { fg = colors.cyan },
    jsxEscapeJs = { fg = colors.fg },
    jsxCloseString = { fg = colors.cyan },
    jsxAttrib = { fg = colors.purple, style = 'italic' },
    jsxString = { fg = colors.green },
    jsxEqual = { fg = colors.purple },
    jsxDot = { fg = colors.cyan },
    jsxSpreadOperator = { fg = colors.purple },
    jsxBraces = { fg = colors.cyan },
    jsxNamespace = { fg = colors.cyan },
  },
})
