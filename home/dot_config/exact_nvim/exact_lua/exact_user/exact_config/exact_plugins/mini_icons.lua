vim.pack.add({
	{
		name = 'mini-icons',
		src = 'https://github.com/nvim-mini/mini.icons',
		version = vim.version.range('*'),
	},
})

local mini_icons = require('mini.icons')

mini_icons.setup({
	default = {
		directory = {
			hl = 'Directory',
		},
	},
})

mini_icons.mock_nvim_web_devicons()
