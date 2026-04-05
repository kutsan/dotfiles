local document_highlight_namespace =
	vim.api.nvim_create_namespace('LspDocumentHighlight')
local document_highlight_autocmd_group =
	vim.api.nvim_create_augroup('LspDocumentHighlight', { clear = true })

local kind_to_hl = {
	[vim.lsp.protocol.DocumentHighlightKind.Text] = 'LspReferenceText',
	[vim.lsp.protocol.DocumentHighlightKind.Read] = 'LspReferenceRead',
	[vim.lsp.protocol.DocumentHighlightKind.Write] = 'LspReferenceWrite',
}

---@param bufnr integer
local function clear_highlight(bufnr)
	vim.api.nvim_buf_clear_namespace(bufnr, document_highlight_namespace, 0, -1)
end

--- Query extmarks on the current line and check if the cursor falls
--- within any of them. Used to skip redundant LSP requests when the
--- cursor moves within the same symbol.
---@param bufnr integer
---@return boolean
local function check_cursor_on_highlight(bufnr)
	local pos = vim.api.nvim_win_get_cursor(0)

	-- nvim_win_get_cursor is (1,0)-indexed; extmarks are (0,0)-indexed.
	local row, col = pos[1] - 1, pos[2]

	local marks = vim.api.nvim_buf_get_extmarks(
		bufnr,
		document_highlight_namespace,
		{ row, 0 },
		{ row, -1 },
		{ details = true }
	)

	-- mark = { id, start_row, start_col, details }
	for _, mark in ipairs(marks) do
		local start_col = mark[3]
		local details = mark[4]
		local end_row = details and details.end_row
		local end_col = details and details.end_col

		if
			end_row
			and end_col
			and (row > mark[2] or (row == mark[2] and col >= start_col))
			and (row < end_row or (row == end_row and col < end_col))
		then
			return true
		end
	end

	return false
end

---@param bufnr integer
---@param results lsp.DocumentHighlight[]
local function apply_highlights(bufnr, results)
	for _, item in ipairs(results) do
		local range = item.range

		-- Convert LSP UTF-16 offsets to byte offsets for extmarks.
		vim.api.nvim_buf_set_extmark(
			bufnr,
			document_highlight_namespace,
			range.start.line,
			vim.lsp.util._get_line_byte_from_position(bufnr, range.start, 'utf-16'),
			{
				end_line = range['end'].line,
				end_col = vim.lsp.util._get_line_byte_from_position(
					bufnr,
					range['end'],
					'utf-16'
				),
				hl_group = kind_to_hl[item.kind] or 'LspReferenceText',
				priority = vim.hl.priorities.user,
			}
		)
	end
end

vim.api.nvim_create_autocmd('LspAttach', {
	group = document_highlight_autocmd_group,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if
			not client
			or not client:supports_method(
				vim.lsp.protocol.Methods.textDocument_documentHighlight,
				args.buf
			)
		then
			return
		end

		local bufnr = args.buf

		---@type function?
		local cancel_fn = nil
		local generation = 0

		local function cancel_pending()
			if cancel_fn then
				pcall(cancel_fn)
				cancel_fn = nil
			end
		end

		local function request_highlight()
			cancel_pending()

			-- Bump generation so that stale callbacks from cancelled requests
			-- (which may still fire) are discarded.
			generation = generation + 1

			local expected = generation
			local winid = vim.api.nvim_get_current_win()

			cancel_fn = vim.lsp.buf_request_all(
				bufnr,
				vim.lsp.protocol.Methods.textDocument_documentHighlight,
				function(lsp_client)
					return vim.lsp.util.make_position_params(
						winid,
						lsp_client.offset_encoding
					)
				end,
				function(results)
					cancel_fn = nil

					if expected ~= generation or not vim.api.nvim_buf_is_valid(bufnr) then
						return
					end

					-- Use the first client that returns results.
					for _, resp in pairs(results) do
						if resp.result then
							apply_highlights(bufnr, resp.result)
							break
						end
					end
				end
			)
		end

		-- Clear existing autocmds for this buffer in case another client
		-- already attached and registered them.
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = document_highlight_autocmd_group,
		})

		vim.api.nvim_create_autocmd('CursorMoved', {
			group = document_highlight_autocmd_group,
			buffer = bufnr,
			callback = function()
				if check_cursor_on_highlight(bufnr) then
					return
				end

				clear_highlight(bufnr)
				request_highlight()
			end,
		})

		vim.api.nvim_create_autocmd('InsertEnter', {
			group = document_highlight_autocmd_group,
			buffer = bufnr,
			callback = function()
				clear_highlight(bufnr)
				cancel_pending()
			end,
		})

		vim.api.nvim_create_autocmd('InsertLeave', {
			group = document_highlight_autocmd_group,
			buffer = bufnr,
			callback = function()
				request_highlight()
			end,
		})

		vim.api.nvim_create_autocmd('LspDetach', {
			group = document_highlight_autocmd_group,
			buffer = bufnr,
			callback = function()
				clear_highlight(bufnr)
				cancel_pending()
			end,
		})
	end,
})
