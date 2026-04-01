vim.pack.add({
	{
		name = 'qmk',
		src = 'github:codethread/qmk.nvim',
	},
})

local qmk = require('qmk')

local opts = {
	name = 'LAYOUT_60_ansi',
	comment_preview = {
		position = 'none',
	},
	layout = {
		'x x x x x x x x x x x x x x',
		'x x x x x x x x x x x x x x',
		'x x x x x x x x x x x x x^x',
		'x^x x x x x x x x x x x x^x',
		'x x x _ _ xx^xx _ _ x x x x',
	},
}

qmk.setup(opts)
