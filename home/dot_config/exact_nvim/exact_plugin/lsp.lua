local lsp_group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true })

-- Highlight references to the symbol under the cursor.
vim.api.nvim_create_autocmd('LspAttach', {
	group = lsp_group,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		if
			client:supports_method(
				vim.lsp.protocol.Methods.textDocument_documentHighlight,
				args.buf
			)
		then
			local highlight_group =
				vim.api.nvim_create_augroup('LspDocumentHighlight', { clear = false })

			-- Clear existing highlights for this buffer.
			vim.api.nvim_clear_autocmds({ buffer = args.buf, group = highlight_group })

			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				group = highlight_group,
				buffer = args.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				group = highlight_group,
				buffer = args.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

-- General keymaps for LSP functions.
vim.api.nvim_create_autocmd('LspAttach', {
	group = lsp_group,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local map_opts = { buffer = args.buf, silent = true }

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, map_opts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, map_opts)
		vim.keymap.set('n', 'J', vim.diagnostic.open_float, map_opts)
		vim.keymap.set('n', 'K', function()
			local width = math.floor(vim.o.columns * 0.8)
			local height = math.floor(vim.o.lines * 0.3)
			vim.lsp.buf.hover({ max_height = height, max_width = width })
		end, map_opts)

		vim.keymap.set({ 'n', 'x' }, '\\f', function()
			if
				client
				and client:supports_method(
					vim.lsp.protocol.Methods.textDocument_formatting,
					args.buf
				)
			then
				vim.lsp.buf.format()
			end

			require('conform').format()
		end, map_opts)
	end,
})

-- Keymaps for inlay hints.
vim.api.nvim_create_autocmd('LspAttach', {
	group = lsp_group,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		if
			client:supports_method(
				vim.lsp.protocol.Methods.textDocument_inlayHint,
				args.buf
			) and vim.lsp.inlay_hint
		then
			vim.keymap.set('n', 'coi', function()
				vim.lsp.inlay_hint.enable(
					not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }),
					{ bufnr = args.buf }
				)
			end, { buffer = args.buf, silent = true, desc = 'Toggle Inlay Hints' })
		end
	end,
})
