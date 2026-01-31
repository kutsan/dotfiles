local Plugin = { 'folke/snacks.nvim' }

Plugin.name = 'snacks'

Plugin.priority = 1000
Plugin.lazy = false

Plugin.opts = {
	zen = { enabled = true, toggles = { dim = false } },
	input = { enabled = true },
	toggle = { enabled = true },
	explorer = {
		enabled = true,
		replace_netrw = true,
	},
	picker = {
		icons = {
			tree = {
				vertical = '│ ',
				middle = '│ ',
				last = '│ ',
			},
		},
		layout = {
			preset = 'vertical',
		},
		enabled = true,
		sources = {
			files = {
				hidden = true,
				ignored = vim.fn.getcwd() == vim.uv.os_homedir(),
			},
			grep = {
				hidden = true,
				ignored = vim.fn.getcwd() == vim.uv.os_homedir(),
			},
			explorer = {
				focus = 'list',
				ignored = true,
				hidden = true,
				git_untracked = true,
				win = {
					list = {
						keys = {
							['/'] = false,
							['?'] = false,
						},
					},
				},
				layout = {
					layout = {
						zindex = 0,
						box = 'vertical',
						position = 'left',
						width = 40,
						{
							win = 'list',
							border = 'none',
							wo = {
								winhighlight = 'FloatBorder:CursorColumn,NormalFloat:CursorColumn',
							},
						},
					},
				},
			},
		},
	},
}

Plugin.keys = {
	{
		'<C-b>',
		function()
			local snacks = require('snacks')
			snacks.picker.buffers()
		end,
		desc = 'Buffers',
	},
	{
		'<C-p>',
		function()
			local snacks = require('snacks')
			snacks.picker.files()
		end,
		desc = 'Find Files',
	},
	{
		'<Space><C-p>',
		function()
			local snacks = require('snacks')
			snacks.picker.git_files()
		end,
		desc = 'Find Files',
	},
	{
		'<Space>s"',
		function()
			local snacks = require('snacks')
			snacks.picker.registers()
		end,
		desc = 'Registers',
	},
	{
		'<Space>h',
		function()
			local snacks = require('snacks')
			snacks.picker.help()
		end,
		desc = 'Help Pages',
	},
	{
		'gs',
		function()
			local snacks = require('snacks')
			snacks.picker.grep()
		end,
		desc = 'Grep',
	},
	{
		'gs',
		function()
			local snacks = require('snacks')
			snacks.picker.grep_word()
		end,
		desc = 'Visual selection or word',
		mode = { 'x' },
	},
	{
		'<Space>f',
		function()
			local snacks = require('snacks')
			snacks.explorer.open()
		end,
		desc = 'File Explorer',
	},
	{
		'<Space>F',
		function()
			local snacks = require('snacks')
			snacks.explorer.reveal()
		end,
		desc = 'Reveal in Explorer',
	},
	{
		'<Space>u',
		function()
			local snacks = require('snacks')
			snacks.picker.undo()
		end,
		desc = 'Undo history',
	},
	{
		'<M-x>',
		function()
			local snacks = require('snacks')
			snacks.picker.commands()
		end,
		desc = 'Commands',
	},
	{
		'<Space>sH',
		function()
			local snacks = require('snacks')
			snacks.picker.highlights()
		end,
		desc = 'Highlights',
	},
	{
		'<Space>z',
		function()
			local snacks = require('snacks')
			snacks.zen()
		end,
		desc = 'Zen Mode',
	},
	{
		'<Space>:',
		function()
			local snacks = require('snacks')
			snacks.picker.command_history()
		end,
	},
	{
		'<Space>/',
		function()
			local snacks = require('snacks')
			snacks.picker.search_history()
		end,
	},
	{
		'<Space>`',
		function()
			local snacks = require('snacks')
			snacks.picker.marks()
		end,
	},
	{
		'<Space>gR',
		function()
			local snacks = require('snacks')
			snacks.picker.resume()
		end,
	},
}

Plugin.init = function()
	vim.api.nvim_create_autocmd('User', {
		pattern = 'VeryLazy',
		callback = function()
			local snacks = require('snacks')
			snacks.toggle.option('spell', { name = 'Spelling' }):map('<Space>us')
		end,
	})
end

return Plugin
