vim.pack.add({
	{
		name = 'mini-pairs',
		src = 'github:nvim-mini/mini.pairs',
		version = vim.version.range('*'),
	},
})

local mini_pairs = require('mini.pairs')

local opts = {
	modes = {
		insert = true,
		command = true,
	},
}

mini_pairs.setup(opts)
