vim.pack.add({
	{
		name = 'surround',
		src = 'github:kylechui/nvim-surround',
		version = vim.version.range('*'),
	},
})

local surround = require('nvim-surround')

vim.g.nvim_surround_no_normal_mappings = true

surround.setup()

vim.keymap.set(
	'n',
	'sa',
	'<Plug>(nvim-surround-normal)',
	{ desc = 'Add surround' }
)
vim.keymap.set(
	'x',
	'sa',
	'<Plug>(nvim-surround-visual)',
	{ desc = 'Add surround' }
)
vim.keymap.set(
	'n',
	'sd',
	'<Plug>(nvim-surround-delete)',
	{ desc = 'Delete surround' }
)
vim.keymap.set(
	'n',
	'sr',
	'<Plug>(nvim-surround-change)',
	{ desc = 'Change surround' }
)
