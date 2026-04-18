-- Update treesitter parsers after `nvim-treesitter` is installed or updated.
vim.api.nvim_create_autocmd('PackChanged', {
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

-- Update mason tools after `mason-tool-installer` is installed or updated.
vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(event)
		local name = event.data.spec.name
		local kind = event.data.kind

		if name ~= 'mason-tool-installer' then
			return
		end

		if kind ~= 'install' and kind ~= 'update' then
			return
		end

		if not event.data.active then
			vim.cmd.packadd('mason')
			vim.cmd.packadd('mason-tool-installer')
		end

		local mason_tool_installer = require('mason-tool-installer')
		mason_tool_installer.check_install(true)
		mason_tool_installer.clean()
	end,
})
