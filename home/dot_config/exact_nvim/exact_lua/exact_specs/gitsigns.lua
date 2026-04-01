vim.pack.add({
	{
		name = 'gitsigns',
		src = 'github:lewis6991/gitsigns.nvim',
	},
})

local gitsigns = require('gitsigns')

local opts = {
	on_attach = function()
		vim.keymap.set(
			'n',
			'<Space>gb',
			gitsigns.blame,
			{ silent = true, desc = 'Git blame' }
		)
	end,
}

gitsigns.setup(opts)
