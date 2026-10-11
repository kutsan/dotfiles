local opts = {
	picker = {
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
		},
	},
}

local function after_setup(snacks)
	local is_mac = vim.fn.has('mac') == 1

	vim.keymap.set('n', '<C-b>', snacks.picker.buffers, { desc = 'Buffers' })
	vim.keymap.set(
		'n',
		is_mac and '<D-p>' or '<C-p>',
		snacks.picker.files,
		{ desc = 'Find files' }
	)
	vim.keymap.set(
		'n',
		is_mac and '<Space><D-p>' or '<Space><C-p>',
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
	vim.keymap.set('n', 'g/', snacks.picker.grep, { desc = 'Grep' })
	vim.keymap.set(
		'x',
		'g/',
		snacks.picker.grep_word,
		{ desc = 'Grep visual selection' }
	)
	vim.keymap.set(
		'n',
		is_mac and '<D-S-p>' or '<C-S-p>',
		snacks.picker.commands,
		{ desc = 'Commands' }
	)
	vim.keymap.set(
		'n',
		'<Space>sH',
		snacks.picker.highlights,
		{ desc = 'Highlights' }
	)
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
	vim.keymap.set(
		'n',
		'<Space>o',
		snacks.picker.recent,
		{ desc = 'Open recent files' }
	)

	vim.api.nvim_create_autocmd('LspAttach', {
		desc = 'Set up picker-backed LSP keymaps when an LSP client attaches to a buffer.',
		group = vim.api.nvim_create_augroup(
			'user.plugin.snacks.lsp_keymaps',
			{ clear = true }
		),
		---@param args { buf: integer }
		callback = function(args)
			---@type { buffer: integer, silent: boolean }
			local map_opts = { buffer = args.buf, silent = true }

			vim.keymap.set(
				'n',
				'gd',
				snacks.picker.lsp_definitions,
				vim.tbl_extend('force', map_opts, { desc = 'LSP definitions' })
			)
			vim.keymap.set(
				'n',
				'gD',
				snacks.picker.lsp_declarations,
				vim.tbl_extend('force', map_opts, { desc = 'LSP declarations' })
			)
			vim.keymap.set(
				'n',
				'gri',
				snacks.picker.lsp_implementations,
				vim.tbl_extend('force', map_opts, { desc = 'LSP implementations' })
			)
			vim.keymap.set(
				'n',
				'grr',
				snacks.picker.lsp_references,
				vim.tbl_extend(
					'force',
					map_opts,
					{ nowait = true, desc = 'LSP references' }
				)
			)
			vim.keymap.set(
				'n',
				'grt',
				snacks.picker.lsp_type_definitions,
				vim.tbl_extend('force', map_opts, { desc = 'LSP type definitions' })
			)
			vim.keymap.set(
				'n',
				'gs',
				snacks.picker.lsp_symbols,
				vim.tbl_extend('force', map_opts, { desc = 'LSP document symbols' })
			)
			vim.keymap.set(
				'n',
				'gO',
				snacks.picker.lsp_symbols,
				vim.tbl_extend('force', map_opts, { desc = 'LSP document symbols' })
			)
			vim.keymap.set(
				'n',
				'<Space>gO',
				snacks.picker.lsp_workspace_symbols,
				vim.tbl_extend('force', map_opts, { desc = 'LSP workspace symbols' })
			)
		end,
	})
end

return { opts = opts, after_setup = after_setup }
