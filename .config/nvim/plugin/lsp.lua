local function on_attach(client)
	if client.server_capabilities.documentHighlightProvider then
		local document_highlight_autocmd_group =
			vim.api.nvim_create_augroup('DocumentHighlight', { clear = true })

		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			group = document_highlight_autocmd_group,
			buffer = 0,
			callback = function()
				if client.server_capabilities.documentHighlightProvider then
					vim.lsp.buf.document_highlight()
				end
			end,
		})

		vim.api.nvim_create_autocmd('CursorMoved', {
			group = document_highlight_autocmd_group,
			buffer = 0,
			callback = function()
				if client.server_capabilities.documentHighlightProvider then
					vim.lsp.buf.clear_references()
				end
			end,
		})
	end

	local map_opts = {
		buffer = true,
		silent = true,
	}

	if vim.lsp.inlay_hint then
		vim.keymap.set('n', 'coi', function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, map_opts)
	end

	vim.keymap.set('n', 'K', function()
		local width = math.floor(vim.o.columns * 0.8)
		local height = math.floor(vim.o.lines * 0.3)

		vim.lsp.buf.hover({
			max_height = height,
			max_width = width,
		})
	end)

	vim.keymap.set('n', 'gd', function()
		vim.lsp.buf.definition()
	end, map_opts)

	vim.keymap.set('n', 'gD', function()
		vim.lsp.buf.declaration()
	end, map_opts)

	vim.keymap.set({ 'n', 'x' }, '\\f', function()
		if client.server_capabilities.documentFormattingProvider then
			vim.lsp.buf.format()
		end

		require('conform').format()
	end, map_opts)

	vim.keymap.set('n', 'J', function()
		vim.diagnostic.open_float()
	end, map_opts)
end

vim.lsp.config('*', {
	on_attach = on_attach,
})
