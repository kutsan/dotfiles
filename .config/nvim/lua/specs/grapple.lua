local Plugin = { 'cbochs/grapple.nvim' }

Plugin.name = 'grapple'

Plugin.cmd = 'Grapple'
Plugin.event = { 'BufReadPost', 'BufNewFile' }

Plugin.opts = {
	scope = 'git_branch',
}

Plugin.keys = {
	{
		'\\bb',
		function()
			require('grapple').toggle()
			vim.cmd.redrawtabline()
		end,
		desc = 'Grapple toggle tag.',
	},
	{
		'\\bl',
		'<cmd>Grapple toggle_tags<cr>',
		desc = 'Grapple open tags window.',
	},
	{
		'\\bn',
		'<cmd>Grapple cycle_tags next<cr>',
		desc = 'Grapple cycle next tag.',
	},
	{
		'\\bp',
		'<cmd>Grapple cycle_tags prev<cr>',
		desc = 'Grapple cycle previous tag.',
	},
}

return Plugin
