vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'Set up LSP keymaps when an LSP client attaches to a buffer.',
	group = vim.api.nvim_create_augroup('LspKeymaps', { clear = true }),
	---@param args { buf: integer }
	callback = function(args)
		---@type { buffer: integer, silent: boolean }
		local map_opts = { buffer = args.buf, silent = true }

		vim.keymap.set(
			'n',
			'J',
			vim.diagnostic.open_float,
			vim.tbl_extend('force', map_opts, { desc = 'Show line diagnostics' })
		)
		vim.keymap.set('n', 'K', function()
			---@type integer
			local width = math.floor(vim.o.columns * 0.8)
			---@type integer
			local height = math.floor(vim.o.lines * 0.3)

			vim.lsp.buf.hover({ max_height = height, max_width = width })
		end, vim.tbl_extend('force', map_opts, { desc = 'LSP hover' }))
	end,
})
