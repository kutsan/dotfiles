local set_undo_ftplugin =
	require('user.api.options.set_undo_ftplugin').set_undo_ftplugin

set_undo_ftplugin(function()
	vim.opt_local.number = nil
	vim.opt_local.relativenumber = nil
	vim.opt_local.wrap = nil
end)
