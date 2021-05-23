local map = require('kutsan.utils').map
local cmd = vim.cmd
local g = vim.g

-- Add optional plugin to 'runtimepath' without sourcing anything.
cmd('silent! packadd! undotree')

-- Open tree on the right side and open diff below that.
g.undotree_WindowLayout = 3

-- Set the tree node shape.
g.undotree_TreeNodeShape = '*'

-- Set the tree vertical shape.
g.undotree_TreeVertShape = '|'

-- Use relative timestamps.
g.undotree_RelativeTimestamp = 1

-- Use short timestamps.
g.undotree_ShortIndicators = true

-- Move focus after being opened.
g.undotree_SetFocusWhenToggle = true

-- Disable 'Press ? for help' text.
g.undotree_HelpLine = false

-- Set the undotree window width.
g.undotree_SplitWidth = 30

-- Disable diff window by default.
g.undotree_DiffAutoOpen = false

-- Set diff window height.
g.undotree_DiffpanelHeight = 10

-- Set the command used to get the diff output.
g.undotree_DiffCommand = 'diff'

-- Highlight changed text.
g.undotree_HighlightChangedText = true

-- Show cursorline.
g.undotree_CursorLine = true

-- Default highlight groups for syntax items.
g.undotree_HighlightSyntaxAdd = 'DiffAdd'
g.undotree_HighlightSyntaxChange = 'DiffChange'
g.undotree_HighlightSyntaxDel = 'DiffDelete'

-- Define mapping.
map('n', '<Space>u', '<Cmd>call undotree#UndotreeToggle()<CR>', { noremap = true, silent = true })
