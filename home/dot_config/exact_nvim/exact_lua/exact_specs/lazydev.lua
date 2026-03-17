local Plugin = { 'folke/lazydev.nvim' }

Plugin.name = 'lazydev'

Plugin.ft = 'lua'

Plugin.dependencies = {
	'blink.cmp',
}

Plugin.opts = {
	library = {
		{
			path = '${3rd}/luv/library',
			words = { 'vim%.uv' },
		},
	},
}

return Plugin
