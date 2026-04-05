local opt = vim.opt

opt.modeline = false -- Disable modeline feature altogether.
opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
opt.shiftwidth = 0 -- Number of spaces to use for each step of auto indent.
opt.softtabstop = -1 -- Number of spaces that a <Tab> counts.
opt.expandtab = true -- Use spaces instead of tab characters.
opt.undofile = true -- Persist undo history to an undo file.
opt.keymap = 'diacritic' -- Enable diacritic key mappings in keymap folder.
