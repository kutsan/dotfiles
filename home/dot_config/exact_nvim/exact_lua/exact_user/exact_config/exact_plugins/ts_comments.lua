vim.pack.add({
	{
		name = 'ts-comments',
		src = 'github:folke/ts-comments.nvim',
	},
})

local ts_comments = require('ts-comments')

ts_comments.setup()
