vim.pack.add({
	{
		name = 'grug-far',
		src = 'github:MagicDuck/grug-far.nvim',
	},
})

local grug_far = require('grug-far')

local opts = {
	headerMaxWidth = 80,
}

grug_far.setup(opts)

vim.keymap.set({ 'n', 'v' }, '<Space>sr', function()
	local ext = vim.bo.buftype == '' and vim.fn.expand('%:e')

	grug_far.open({
		transient = true,
		prefills = {
			filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
		},
	})
end, { desc = 'Search and replace' })
