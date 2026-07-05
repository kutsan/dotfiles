---@param item table
---@return table
local function accept_word(item)
	local insert_text = item.insert_text
	local range = item.range

	if type(insert_text) ~= 'string' or not range then
		return item
	end

	local current = table.concat(
		vim.api.nvim_buf_get_text(
			range.buf,
			range.start_row,
			range.start_col,
			range.end_row,
			range.end_col,
			{}
		),
		'\n'
	)

	local i = 1

	while
		i <= #insert_text
		and i <= #current
		and insert_text:sub(i, i) == current:sub(i, i)
	do
		i = i + 1
	end

	local word = insert_text:sub(i):match('%s*[^%s]%w*') or ''
	item.insert_text = insert_text:sub(1, i - 1) .. word

	return item
end

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
				'<C-l>',
				vim.lsp.inline_completion.get,
				{ desc = 'LSP: accept inline completion', buffer = bufnr }
			)
			vim.keymap.set(
				'i',
				'<C-]>',
				vim.lsp.inline_completion.select,
				{ desc = 'LSP: next inline completion', buffer = bufnr }
			)
			vim.keymap.set('i', '<C-j>', function()
				vim.lsp.inline_completion.get({ on_accept = accept_word })
			end, { desc = 'LSP: accept inline completion word', buffer = bufnr })
		end
	end,
})
