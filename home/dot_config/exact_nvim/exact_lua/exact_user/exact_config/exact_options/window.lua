local opt = vim.opt

opt.breakindent = true -- Wrapped lines will be visually indented with same amount of space.
opt.wrap = false -- Prevent wrapping for long lines.
opt.linebreak = true -- Wrap long lines at a character in 'breakat'.
opt.number = true -- Print the line number in front of each line.
opt.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
opt.signcolumn = 'yes:1' -- Always draw the sign column including sign space even there is no sign in it.
opt.foldmethod = 'indent' -- Use indentation levels for folding.
opt.foldnestmax = 4 -- Maximum nesting of folds.
opt.numberwidth = 4 -- Minimum number column width.
