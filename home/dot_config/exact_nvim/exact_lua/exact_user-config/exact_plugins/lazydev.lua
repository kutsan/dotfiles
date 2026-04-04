vim.pack.add({
	{
		name = 'lazydev',
		src = 'github:folke/lazydev.nvim',
	},
})

local lazydev = require('lazydev')

local opts = {
	library = {
		{
			path = '${3rd}/luv/library',
			words = { 'vim%.uv' },
		},
	},
}

lazydev.setup(opts)
