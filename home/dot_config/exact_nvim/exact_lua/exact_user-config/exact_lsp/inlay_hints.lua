vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'Enable inlay hints and its keymaps for LSP clients that support it.',
	group = vim.api.nvim_create_augroup('LspInlayHints', { clear = true }),
	---@param args { buf: integer, data: { client_id: integer } }
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
