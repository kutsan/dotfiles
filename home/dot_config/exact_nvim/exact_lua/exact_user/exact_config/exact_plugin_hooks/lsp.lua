-- Update mason tools after `mason-tool-installer` is updated.
vim.api.nvim_create_autocmd('PackChanged', {
	desc = 'Refresh mason tools after `mason-tool-installer` is updated.',
	group = vim.api.nvim_create_augroup(
		'user.plugin_hooks.mason_tools',
		{ clear = true }
	),
	callback = function(event)
		local name = event.data.spec.name
		local kind = event.data.kind

		if name ~= 'mason-tool-installer' then
			return
		end

		if kind ~= 'update' or not package.loaded['mason-tool-installer'] then
			return
		end

		local mason_tool_installer = require('mason-tool-installer')
		mason_tool_installer.check_install(true)
		mason_tool_installer.clean()
	end,
})
