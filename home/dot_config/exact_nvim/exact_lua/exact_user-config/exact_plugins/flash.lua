vim.pack.add({
	{
		name = 'flash',
		src = 'github:folke/flash.nvim',
	},
})

local flash = require('flash')

local opts = {
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

flash.setup(opts)

vim.keymap.set(
	{ 'n', 'x', 'o' },
	'grv',
	flash.treesitter,
	{ desc = 'Flash treesitter selection' }
)

vim.keymap.set(
	{ 'n', 'x', 'o' },
	'<C-/>',
	flash.jump,
	{ desc = 'Flash jump' }
)
