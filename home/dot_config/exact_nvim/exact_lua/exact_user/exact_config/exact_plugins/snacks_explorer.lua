local opts = {
	explorer = {
		replace_netrw = true,
	},
	picker = {
		sources = {
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

local function after_setup(snacks)
	vim.keymap.set('n', '<Space>f', function()
		local explorer = snacks.picker.get({ source = 'explorer' })[1]
		if explorer then
			explorer:focus()
		else
			snacks.explorer.reveal()
		end
	end, { desc = 'Reveal in explorer' })

	vim.api.nvim_create_autocmd('QuitPre', {
		desc = 'Close Neovim automatically when Snacks Explorer is the last window in the view.',
		group = vim.api.nvim_create_augroup(
			'user.plugin.snacks.auto_close_explorer',
			{ clear = true }
		),
		callback = function()
			local snacks_windows = {}
			local floating_windows = {}
			local windows = vim.api.nvim_list_wins()

			for _, w in ipairs(windows) do
				local filetype = vim.api.nvim_get_option_value(
					'filetype',
					{ buf = vim.api.nvim_win_get_buf(w) }
				)

				if filetype:match('snacks_') ~= nil then
					table.insert(snacks_windows, w)
				elseif vim.api.nvim_win_get_config(w).relative ~= '' then
					table.insert(floating_windows, w)
				end
			end

			if #windows - #floating_windows - #snacks_windows == 1 then
				for _, picker in ipairs(snacks.picker.get()) do
					picker:close()
				end

				for _, w in ipairs(snacks_windows) do
					if vim.api.nvim_win_is_valid(w) then
						vim.api.nvim_win_close(w, true)
					end
				end
			end
		end,
	})
end

return { opts = opts, after_setup = after_setup }
