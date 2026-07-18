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
	file = {
		['README.md'] = { glyph = '󰍔', hl = 'MiniIconsGrey' }, -- U+F0354
		['init.lua'] = { glyph = '󰢱', hl = 'MiniIconsAzure' }, -- U+F08B1
	},
	filetype = {
		yaml = { glyph = '󰒓', hl = 'MiniIconsPurple' }, -- U+F0493
		sh = { glyph = '󰆍', hl = 'MiniIconsGrey' }, -- U+F018D
		bash = { glyph = '󰆍', hl = 'MiniIconsGreen' }, -- U+F018D
		zsh = { glyph = '󰆍', hl = 'MiniIconsGreen' }, -- U+F018D
	},
})

mini_icons.mock_nvim_web_devicons()
