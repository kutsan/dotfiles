-- Update treesitter parsers after `nvim-treesitter` is installed or updated.
vim.api.nvim_create_autocmd('PackChanged', {
	desc = 'Update treesitter parsers after the plugin is installed or updated.',
	group = vim.api.nvim_create_augroup(
		'user.plugin_hooks.treesitter',
		{ clear = true }
	),
	callback = function(event)
		local name = event.data.spec.name
		local kind = event.data.kind

		if name ~= 'treesitter' then
			return
		end

		if kind ~= 'install' and kind ~= 'update' then
			return
		end

		if not event.data.active then
			vim.cmd.packadd('treesitter')
		end

		vim.cmd.TSUpdate()
	end,
})
