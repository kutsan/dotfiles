local Plugin = { 'mbbill/undotree' }

Plugin.name = 'undotree'

Plugin.cmd = 'UndotreeToggle'

Plugin.init = function()
  local keymap = vim.keymap

  keymap.set('n', '<Space>u', vim.cmd.UndotreeToggle, { silent = true })
end

Plugin.config = function()
  local g = vim.g

  -- Open tree on the right side and open diff below that.
  g.undotree_WindowLayout = 3

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

  -- Tree split characters.
  g.undotree_TreeSplitShape = '/'
  g.undotree_TreeReturnShape = '\\'
  g.undotree_TreeNodeShape = '*'
  g.undotree_TreeVertShape = '|'

  -- Default highlight groups for syntax items.
  g.undotree_HighlightSyntaxAdd = 'DiffAdd'
  g.undotree_HighlightSyntaxChange = 'DiffChange'
  g.undotree_HighlightSyntaxDel = 'DiffDelete'
end

return Plugin
