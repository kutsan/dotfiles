vim.pack.add({
	{
		name = 'eyeliner',
		src = 'github:jinh0/eyeliner.nvim',
	},
})

local eyeliner = require('eyeliner')

local opts = {
	highlight_on_key = true,
}

eyeliner.setup(opts)
