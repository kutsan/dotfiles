local Plugin = { 'NTBBloodbath/color-converter.nvim' }

Plugin.name = 'color-converter'
Plugin.opts = {}

Plugin.keys = {
	{
		'\\cc',
		function()
			local color_converter = require('color-converter')
			color_converter.cycle()
		end,
		desc = 'Color Converter',
	},
}

return Plugin
