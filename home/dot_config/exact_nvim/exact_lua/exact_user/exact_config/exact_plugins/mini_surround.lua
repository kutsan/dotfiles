vim.pack.add({
	{
		name = 'mini-surround',
		src = 'github:nvim-mini/mini.surround',
		version = vim.version.range('*'),
	},
})

local mini_surround = require('mini.surround')

mini_surround.setup()
