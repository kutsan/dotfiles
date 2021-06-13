local set_undo_ftplugin = require('kutsan.utils').set_undo_ftplugin

set_undo_ftplugin(
  'setlocal number< relativenumber<' .. " | execute 'nunmap <buffer> \\r'"
)
