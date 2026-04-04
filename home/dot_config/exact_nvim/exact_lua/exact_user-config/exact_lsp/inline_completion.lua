vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'Enable inline completion and its keymaps for LSP clients that support it.',
	group = vim.api.nvim_create_augroup('LspInlineCompletion', { clear = true }),
	---@param args { buf: integer, data: { client_id: integer } }
	callback = function(args)
		local bufnr = args.buf
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		if
			client:supports_method(
				vim.lsp.protocol.Methods.textDocument_inlineCompletion,
				bufnr
			)
		then
			vim.lsp.inline_completion.enable(true, { bufnr = bufnr })

			vim.keymap.set(
				'i',
				'<M-l>',
				vim.lsp.inline_completion.get,
				{ desc = 'LSP: accept inline completion', buffer = bufnr }
			)
			vim.keymap.set(
				'i',
				'<M-]>',
				vim.lsp.inline_completion.select,
				{ desc = 'LSP: switch inline completion', buffer = bufnr }
			)
		end
	end,
})
