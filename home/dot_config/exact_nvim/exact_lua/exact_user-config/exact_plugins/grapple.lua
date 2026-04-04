vim.pack.add({
	{
		name = 'grapple',
		src = 'github:cbochs/grapple.nvim',
	},
})

local grapple = require('grapple')

local opts = {
	scope = 'git_branch',
}

grapple.setup(opts)

vim.keymap.set('n', '\\bb', function()
	grapple.toggle()
	vim.cmd.redrawtabline()
end, { desc = 'Toggle grapple tag' })

vim.keymap.set(
	'n',
	'\\bl',
	'<cmd>Grapple toggle_tags<cr>',
	{ desc = 'Open grapple tags window' }
)

vim.keymap.set(
	'n',
	'\\bn',
	'<cmd>Grapple cycle_tags next<cr>',
	{ desc = 'Cycle to next grapple tag' }
)

vim.keymap.set(
	'n',
	'\\bp',
	'<cmd>Grapple cycle_tags prev<cr>',
	{ desc = 'Cycle to previous grapple tag' }
)
