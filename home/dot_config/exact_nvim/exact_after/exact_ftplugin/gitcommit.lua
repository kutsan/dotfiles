local set_undo_ftplugin =
	require('user.api.options.set_undo_ftplugin').set_undo_ftplugin

set_undo_ftplugin(function()
	vim.opt_local.spell = nil
end)
