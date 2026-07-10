local set_undo_ftplugin =
	require('user.api.options.set_undo_ftplugin').set_undo_ftplugin

set_undo_ftplugin({
	'setlocal commentstring<',
	'setlocal listchars<',
	'lua vim.b.disable_multispace_listchars = nil',
})
