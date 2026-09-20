-- Remove installed plugins that no `vim.pack.add` call claims anymore.
vim.api.nvim_create_autocmd('VimEnter', {
	desc = 'Remove plugins that are no longer part of the configuration.',
	group = vim.api.nvim_create_augroup(
		'user.plugin_hooks.clean',
		{ clear = true }
	),
	callback = function()
		local orphans = vim
			.iter(vim.pack.get())
			:filter(function(plugin)
				return not plugin.active
			end)
			:map(function(plugin)
				return plugin.spec.name
			end)
			:totable()

		if #orphans == 0 then
			return
		end

		vim.pack.del(orphans)
	end,
})
