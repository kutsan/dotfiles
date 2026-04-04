vim.pack.add({
	{
		name = 'mason',
		src = 'github:mason-org/mason.nvim',
	},
})

local mason = require('mason')

mason.setup()
