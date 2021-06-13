local cmd = vim.cmd

-- Fix 'commentstring'.
-- opt_local.commentstring = '; %s'
-- Use cmd until https://github.com/neovim/neovim/issues/14670 is fixed.
cmd('setlocal commentstring=;\\ %s')
