local g = vim.g
local cmd = vim.cmd

-- Enable loading {ftdetect,ftplugin,indent}/*.vim files.
cmd('filetype plugin indent on')

-- Enable loading syntax/*.vim files.
g.syntax_on = true

-- Disable unused built-in plugins.
g.loaded_gzip = true
g.loaded_rrhelper = true
g.loaded_tarPlugin = true
g.loaded_zipPlugin = true
g.loaded_netrwPlugin = true
g.loaded_netrwFileHandlers = true
g.loaded_netrwSettings = true
g.loaded_2html_plugin = true
g.loaded_vimballPlugin = true
g.loaded_getscriptPlugin = true
g.loaded_logipat = true
g.loaded_tutor_mode_plugin = true
g.loaded_matchit = true
