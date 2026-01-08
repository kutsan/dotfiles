local Plugin = { 'folke/flash.nvim' }

Plugin.name = 'flash'

Plugin.event = 'VeryLazy'

Plugin.opts = {
	search = {
		multi_window = false,
	},
	modes = {
		search = {
			enabled = false,
		},
		char = {
			enabled = false,
		},
	},
	highlight = {
		backdrop = false,
	},
	prompt = {
		enabled = false,
	},
}

Plugin.keys = {
	{
		'grv',
		mode = { 'n', 'x', 'o' },
		function()
			require('flash').treesitter()
		end,
		desc = 'Active flash in tree-sitter selection mode.',
	},
	{
		'<C-/>',
		mode = { 'n', 'x', 'o' },
		function()
			require('flash').jump()
		end,
		desc = 'Flash',
	},
}

return Plugin
