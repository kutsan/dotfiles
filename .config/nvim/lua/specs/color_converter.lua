local Plugin = { 'NTBBloodbath/color-converter.nvim' }

Plugin.name = 'color-converter'
Plugin.opts = {}

Plugin.keys = {
	{
		'<Space>cc',
		function()
			local color_converter = require('color-converter')
			color_converter.cycle()

			-- Go back to the original position after conversion.
			vim.api.nvim_feedkeys('``', 'n', true)
		end,
		desc = 'Color Converter',
	},
}

return Plugin
