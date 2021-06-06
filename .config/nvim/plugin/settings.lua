local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local env = vim.env

-- Colorscheme
cmd('colorscheme material')

-- Global Options
opt.termguicolors = true -- Enables 24-bit RGB color support.
opt.mouse = table.concat({ -- Enable mouse support for normal and visual modes.
  'n', -- Normal mode
  'v', -- Visual mode
})
opt.joinspaces = false -- Disable inserting two spaces after `.`, `?`, `!` with join command.
opt.startofline = true -- Move cursor to the start of each line when jumping with certain commands.
opt.report = 1000 -- Threshold for reporting number of lines changed.
opt.scrolloff = 5 -- Minimum number of screen lines to keep above and below the cursor.
opt.shortmess =
  table.concat({ -- Use abbreviations and short messages in command menu line.
    'f', -- Use "(3 of 5)" instead of "(file 3 of 5)".
    'i', -- Use "[noeol]" instead of "[Incomplete last line]".
    'l', -- Use "999L, 888C" instead of "999 lines, 888 characters".
    'm', -- Use "[+]" instead of "[Modified]".
    'n', -- Use "[New]" instead of "[New File]".
    'r', -- Use "[RO]" instead of "[readonly]".
    'w', -- Use "[w]", "[a]" instead of "written", "appended".
    'x', -- Use "[dos]", "[unix]", "[mac]" instead of "[dos format]", "[unix format]", "[mac format]".
    'o', -- Overwrite message for writing a file with subsequent message.
    'O', -- Message for reading a file overwrites any previous message.
    's', -- Disable "search hit BOTTOM, continuing at TOP" such messages.
    't', -- Truncate file message at the start if it is too long.
    'T', -- Truncate other messages in the middle if they are too long.
    'I', -- Don't give the :intro message when starting.
    'c', -- Don't give ins-completion-menu messages.
    'F', -- Don't give the file info when editing a file.
  })
opt.sidescroll = 5 -- Columns to scroll horizontally when cursor is moved off the screen.
opt.sidescrolloff = 5 -- Minimum number of screen columns to keep to cursor right.
opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete.
opt.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete.
opt.updatetime = 1000 -- Trigger CursorHold event faster.
opt.diffopt = { -- Option settings for diff mode.
  'filler', -- Show filler lines.
  'vertical', -- Start diff mode with vertical splits.
  'hiddenoff', -- Do not use diff mode for a buffer when it becomes hidden.
  'foldcolumn:0', -- Set the 'foldcolumn' option to 0.
  'algorithm:histogram', -- Use the specified diff algorithm.
}
opt.completeopt = { -- Options for insert mode completion.
  'menuone', -- Use the popup menu also when there is only one match.
  'noselect', -- Do not select a match in the menu.
}
opt.fillchars = { -- Characters to be used in various user-interface elements.
  stl = ' ', -- Statusline of the current window.
  stlnc = ' ', -- Statusline of the non-current windows.
  vert = ' ', -- Vertical separator to be used with :vsplit.
  fold = ' ', -- Character to be used with 'foldtext'.
  diff = ' ', -- Deleted lines of the 'diff' option.
  msgsep = '─', -- Message separator for 'display' option.
  eob = ' ', -- Empty lines at the end of a buffer.
}
opt.ruler = false -- Disable showing line and column numbers in command line.
opt.list = true -- Show characters in 'listchars' in place of certain special characters.
opt.listchars = { -- Strings to use when 'list' option set.
  tab = '│ ', -- Characters to be used to show a tab.
  nbsp = '␣', -- Character to show for a non-breakable space character.
  extends = '·', -- Character to show in the last column, when 'wrap' is off.
  precedes = '·', -- Character to show in the first visible column.
}
opt.pumheight = 10 -- Maximum number of items to show in the popup menu.
opt.inccommand = 'split' -- Show live substitution results as you type.
opt.shiftround = true -- Round indent to multiple of 'shiftwidth'.
opt.foldlevelstart = 99 -- Start editing with all folds open.
opt.foldopen = { -- Specifies for which type of commands folds will be opened.
  'hor', -- Horizontal movements: "l", "w", "fx", etc.
  'mark', -- Jumping to a mark: "'m", CTRL-O, etc.
  'percent', -- % key.
  'quickfix', -- ":cn", ":crew", ":make", etc.
  'tag', -- Jumping to a tag: ":ta", CTRL-T, etc.
  'undo', -- Undo or redo: "u" and CTRL-R.
}
opt.grepprg = 'grep ' -- Program to use for the :grep command.
  .. '--line-number '
  .. '--binary-file="without-match" '
  .. '--no-messages '
  .. '--recursive '
  .. '--exclude-dir={.git,node_modules} '
  .. '--perl-regexp'
opt.grepformat = '%f:%l:%c:%m,%f:%l:%m' -- Format to recognize for the :grep command output.
opt.ignorecase = true -- Ignore case in search patterns.
opt.smartcase = true -- Set 'noignorecase' if search pattern contains an uppercase letter.
opt.hlsearch = false -- Disable highlight search matches.
opt.undolevels = 100000 -- Maximum number of changes that can be undone.
opt.hidden = true -- Buffers becomes hidden when they are abandoned.
opt.splitbelow = true -- Splitting a window will put the new window below of the current one.
opt.splitright = true -- Splitting a window will put the new window right of the current one.
opt.switchbuf = 'useopen' -- Jump to the first open window that contains the specified buffer.
opt.showcmd = false -- Disable displaying key presses at the right bottom.
opt.showmode = false -- Disable native mode indicator.
opt.wildcharm = fn.char2nr('<C-z>') -- The key to start wildcard expansion inside macro.
opt.tabline = '%!kutsan#settings#tabline()' -- Custom tabline modifier function.

-- Window Options
opt.breakindent = true -- Wrapped lines will be visually indented with same amount of space.
opt.wrap = false -- Prevent wrapping for long lines.
opt.linebreak = true -- Wrap long lines at a character in 'breakat'.
opt.number = true -- Print the line number in front of each line.
opt.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
opt.signcolumn = 'yes' -- Always draw the sign column even there is no sign in it.
opt.foldmethod = 'indent' -- Use indent folding method to fold lines.

-- Buffer Options
opt.modeline = false -- Disable modeline feature altogether.
opt.keymap = 'diacritic' -- Enable diacritic key mappings in keymap folder.
opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
opt.shiftwidth = 0 -- Number of spaces to use for each step of auto indent.
opt.softtabstop = -1 -- Number of spaces that a <Tab> counts.
opt.expandtab = true -- Use spaces instead of tab characters.
opt.undofile = true -- Persist undo history to an undo file.

-- Root
if env.SUDO_USER ~= nil then
  opt.swapfile = false
  opt.backup = false
  opt.writebackup = false
  opt.undofile = false
  opt.shada = ''
end
