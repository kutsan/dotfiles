vim.pack.add({
	{
		name = 'early-retirement',
		src = 'github:chrisgrieser/nvim-early-retirement',
	},
})

local early_retirement = require('early-retirement')

early_retirement.setup({})
