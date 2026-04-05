vim.pack.add({
	{
		name = 'color-converter',
		src = 'github:NTBBloodbath/color-converter.nvim',
	},
})

local color_converter = require('color-converter')

color_converter.setup()

vim.keymap.set(
	'n',
	'\\cc',
	color_converter.cycle,
	{ desc = 'Cycle color format' }
)
