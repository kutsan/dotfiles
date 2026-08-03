local set_undo_ftplugin =
	require('user.api.options.set_undo_ftplugin').set_undo_ftplugin

set_undo_ftplugin(function()
	vim.opt_local.commentstring = nil
	vim.opt_local.listchars = nil

	vim.b.disable_multispace_listchars = nil
end)
