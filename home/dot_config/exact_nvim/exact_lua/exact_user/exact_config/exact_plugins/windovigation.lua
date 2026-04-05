vim.pack.add({
	{
		name = 'windovigation',
		src = 'github:volskaya/windovigation.nvim',
	},
})

local actions = require('windovigation.actions')
local windovigation = require('windovigation')

local opts = {
	keymaps = false,
}

windovigation.setup(opts)

vim.keymap.set('n', ']b', actions.move_to_next_file, { desc = 'Next file' })
vim.keymap.set(
	'n',
	'[b',
	actions.move_to_previous_file,
	{ desc = 'Previous file' }
)
vim.keymap.set('n', '[B', actions.move_to_first_file, { desc = 'First file' })
vim.keymap.set('n', ']B', actions.move_to_last_file, { desc = 'Last file' })
