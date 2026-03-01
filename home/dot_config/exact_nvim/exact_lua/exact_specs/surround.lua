local Plugin = { 'kylechui/nvim-surround' }

Plugin.name = 'surround'
Plugin.version = '*'

Plugin.event = 'VeryLazy'

Plugin.opts = {}

Plugin.init = function(_, opts)
	local surround = require('nvim-surround')

	-- Disable default key mappings.
	vim.g.nvim_surround_no_normal_mappings = true

	surround.setup(opts)

	vim.keymap.set('n', 'sa', '<Plug>(nvim-surround-normal)', {
		desc = 'Add a surrounding pair around a motion',
	})
	vim.keymap.set('x', 'sa', '<Plug>(nvim-surround-visual)', {
		desc = 'Add a surrounding pair around a visual selection',
	})
	vim.keymap.set('n', 'sd', '<Plug>(nvim-surround-delete)', {
		desc = 'Delete a surrounding pair',
	})
	vim.keymap.set('n', 'sr', '<Plug>(nvim-surround-change)', {
		desc = 'Change a surrounding pair',
	})
end

return Plugin
