vim.pack.add({
	{
		name = 'scope',
		src = 'github:tiagovla/scope.nvim',
	},
})

local scope = require('scope')

scope.setup()
