local cmd = vim.cmd
local g = vim.g

-- Disable built-in statusline.
g.qf_disable_statusline = true

local qf_statusline = {
  '%{repeat(nr2char(32),4)}', -- Generate space characters given number of times.
  ' ', -- Show a custom list icon.
  '%{repeat(nr2char(32),1)}',
  '%t', -- File name, either [Quickfix List] or [Location List].
  '%{exists("w:quickfix_title")?"\\ "..w:quickfix_title:""}',
  '%=', -- Align all items to right from this point on.
  '%{repeat(nr2char(32),1)}',
  '%l/%L', -- Current line number and total item count.
  '%{repeat(nr2char(32),1)}',
}

-- Set statusline.
-- opt_local.statusline = table.concat(qf_statusline)
-- Use cmd until https://github.com/neovim/neovim/issues/14670 is fixed.
cmd(string.format('setlocal statusline=%s', table.concat(qf_statusline)))
