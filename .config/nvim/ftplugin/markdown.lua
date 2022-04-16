local g = vim.g
local opt_local = vim.opt_local

-- Disable all line numbers.
opt_local.number = false
opt_local.relativenumber = false

-- Disable conceal feature of markdown ftplugin.
g.vim_markdown_conceal = false
g.vim_markdown_conceal_code_blocks = false
