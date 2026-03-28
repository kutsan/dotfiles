local Plugin = { 'folke/snacks.nvim' }

Plugin.name = 'snacks'

Plugin.priority = 1000
Plugin.lazy = false

Plugin.opts = {
	input = { enabled = true },
	toggle = { enabled = true },
	explorer = {
		enabled = true,
		replace_netrw = true,
	},
	bigfile = {
		enabled = true,
	},
	image = {
		enabled = true,
	},
	zen = {
		enabled = true,
		win = {
			width = 100,
			backdrop = {
				transparent = false,
				blend = 99,
			},
		},
		toggles = {
			dim = false,
		},
	},
	picker = {
		enabled = true,
		icons = {
			tree = {
				vertical = '│ ',
				middle = '│ ',
				last = '│ ',
			},
			git = {
				added = '●',
				modified = '●',
				deleted = '✖',
				renamed = '➜',
				untracked = '?',
				ignored = '◌',
				staged = '✓',
				conflicted = '!',
			},
			diagnostics = {
				Error = '✘ ',
				Warn = '⚠ ',
				Hint = '⚑ ',
				Info = 'ℹ ',
			},
		},
		win = {
			input = {
				keys = {
					['<Tab>'] = { 'list_down', mode = { 'i', 'n' } },
					['<S-Tab>'] = { 'list_up', mode = { 'i', 'n' } },
				},
			},
			list = {
				keys = {
					['<Tab>'] = 'list_down',
					['<S-Tab>'] = 'list_up',
				},
			},
		},
		layout = {
			preset = 'vscode',
		},
		sources = {
			files = {
				hidden = true,
			},
			grep = {
				hidden = true,
			},
			explorer = {
				ignored = true,
				hidden = true,
				git_untracked = true,
				follow_file = true,
				exclude = { 'node_modules' },
				win = {
					list = {
						keys = {
							-- Navigation
							['h'] = 'explorer_close',
							['l'] = 'confirm',
							['<CR>'] = 'confirm',
							['-'] = 'explorer_up',
							['.'] = 'tcd',

							-- Selection
							['<Tab>'] = 'select_and_next',

							-- File Operations
							['c'] = 'explorer_add',
							['r'] = 'explorer_rename',
							['y'] = { 'explorer_yank', mode = { 'n', 'x' } },
							['d'] = 'explorer_move',
							['D'] = 'explorer_del',
							['p'] = 'explorer_paste',
							['o'] = 'explorer_open',

							-- Disabled defaults
							['a'] = false,
							['m'] = false,
							['u'] = false,
							['P'] = false,
							['H'] = false,
							['I'] = false,
							['Z'] = false,
							['<C-c>'] = false,
							['<C-t>'] = false,
							['<leader>/'] = false,
							['/'] = false,
							['?'] = false,
							[']g'] = false,
							['[g'] = false,
							[']d'] = false,
							['[d'] = false,
							[']w'] = false,
							['[w'] = false,
							[']e'] = false,
							['[e'] = false,
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

			local explorer = snacks.picker.get({ source = 'explorer' })[1]

			if explorer then
				explorer:focus()
			else
				snacks.explorer.reveal()
			end
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
		'<Space>r',
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
