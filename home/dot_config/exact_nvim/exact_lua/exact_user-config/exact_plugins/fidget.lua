vim.pack.add({
	{
		name = 'fidget',
		src = 'github:j-hui/fidget.nvim',
	},
})

local fidget = require('fidget')

fidget.setup()
