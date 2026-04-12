vim.pack.add({
	{
		name = 'snacks',
		src = 'github:folke/snacks.nvim',
	},
})

local snacks = require('snacks')

local opts = {
	input = { enabled = true },
	toggle = { enabled = true },
	explorer = {
		enabled = true,
		replace_netrw = true,
	},
	bigfile = {
		enabled = true,
	},
	statuscolumn = {
		enabled = true,
		folds = {
			open = true,
			git_hl = true,
		},
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
				layout = 'ivy',
			},
			explorer = {
				ignored = true,
				hidden = true,
				git_untracked = true,
				follow_file = true,
				exclude = { 'node_modules', '.DS_Store' },
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

snacks.setup(opts)

snacks.toggle.option('spell', { name = 'Spelling' }):map('<Space>us')

vim.keymap.set('n', '<C-b>', snacks.picker.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<C-p>', snacks.picker.files, { desc = 'Find files' })
vim.keymap.set(
	'n',
	'<Space><C-p>',
	snacks.picker.git_files,
	{ desc = 'Find git files' }
)
vim.keymap.set(
	'n',
	'<Space>s"',
	snacks.picker.registers,
	{ desc = 'Registers' }
)
vim.keymap.set('n', '<Space>h', snacks.picker.help, { desc = 'Help pages' })
vim.keymap.set('n', 'gs', snacks.picker.grep, { desc = 'Grep' })
vim.keymap.set(
	'x',
	'gs',
	snacks.picker.grep_word,
	{ desc = 'Grep visual selection' }
)

vim.keymap.set('n', '<Space>f', function()
	local explorer = snacks.picker.get({ source = 'explorer' })[1]
	if explorer then
		explorer:focus()
	else
		snacks.explorer.reveal()
	end
end, { desc = 'Reveal in explorer' })

vim.keymap.set('n', '<M-x>', snacks.picker.commands, { desc = 'Commands' })
vim.keymap.set(
	'n',
	'<Space>sH',
	snacks.picker.highlights,
	{ desc = 'Highlights' }
)
vim.keymap.set('n', '<Space>z', snacks.zen.zen, { desc = 'Toggle zen mode' })
vim.keymap.set(
	'n',
	'<Space>:',
	snacks.picker.command_history,
	{ desc = 'Command history' }
)
vim.keymap.set(
	'n',
	'<Space>/',
	snacks.picker.search_history,
	{ desc = 'Search history' }
)
vim.keymap.set('n', '<Space>`', snacks.picker.marks, { desc = 'Pick marks' })
vim.keymap.set(
	'n',
	'<Space>r',
	snacks.picker.resume,
	{ desc = 'Resume last picker' }
)
