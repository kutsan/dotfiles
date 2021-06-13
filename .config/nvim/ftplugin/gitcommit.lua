local cmd = vim.cmd

-- Always enable spell checking.
-- opt_local.spell = true
-- Use cmd until https://github.com/neovim/neovim/issues/14670 is fixed.
cmd('setlocal spell')
