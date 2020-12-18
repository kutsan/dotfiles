local g = vim.g
local cmd = vim.cmd
local fn = vim.fn

-- Enable loading {ftdetect,ftplugin,indent}/*.vim files.
cmd('filetype plugin indent on')

-- Set leader keys.
g.mapleader = ' '
g.maplocalleader = '\\'

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

-- Set internal g:clipboard to save some startup time.
if fn.has('mac') then
	g.clipboard = {
		name = 'pbcopy',
		cache_enabled = false,
		copy = {
		  ['+'] = 'pbcopy',
		  ['*'] = 'pbcopy'
		},
		paste = {
		  ['+'] = 'pbpaste',
		  ['*'] = 'pbpaste'
		}
	}
elseif not fn.empty('$DISPLAY') and fn.executable('xclip') then
	g.clipboard = {
		name = 'xclip',
		cache_enabled = false,
		copy = {
		  ['+'] = 'xclip -quiet -i -selection clipboard',
		  ['*'] = 'xclip -quiet -i -selection primary'
		},
		paste = {
		  ['+'] = 'xclip -o -selection clipboard',
		  ['*'] = 'xclip -o -selection primary'
		}
	}
end
