local set_undo_ftplugin = require('user/utils').set_undo_ftplugin

set_undo_ftplugin(
	'setlocal number< relativenumber<' .. " | execute 'nunmap <buffer> \\r'"
)
