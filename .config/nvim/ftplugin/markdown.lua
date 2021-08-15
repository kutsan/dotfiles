local g = vim.g
local cmd = vim.cmd

-- Disable all line numbers.
-- opt_local.number = false
-- opt_local.relativenumber = false
-- Use cmd until https://github.com/neovim/neovim/issues/14670 is fixed.
cmd('setlocal nonumber')
cmd('setlocal norelativenumber')

-- Disable conceal feature of markdown ftplugin.
g.vim_markdown_conceal = false
g.vim_markdown_conceal_code_blocks = false
