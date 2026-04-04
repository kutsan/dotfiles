---@param opts { force: boolean? }
---@return false?
local function remove(opts)
	---@type integer
	local target_buf_id = vim.api.nvim_get_current_buf()

	-- Do nothing if buffer is in modified state.
	if
		not opts.force and vim.api.nvim_buf_get_option(target_buf_id, 'modified')
	then
		return false
	end

	-- Hide target buffer from all windows.
	---@type integer[]
	local win_ids = vim.fn.win_findbuf(target_buf_id)

	for _, win_id in ipairs(win_ids) do
		---@type integer
		local current_buf_id = vim.api.nvim_win_get_buf(win_id)

		vim.api.nvim_win_call(win_id, function()
			-- Try using alternate buffer
			---@type integer
			local alt_buf_id = vim.fn.bufnr('#')
			if alt_buf_id ~= current_buf_id and vim.fn.buflisted(alt_buf_id) == 1 then
				vim.api.nvim_win_set_buf(win_id, alt_buf_id)
				return
			end

			-- Try using previous buffer
			vim.cmd.bprevious()
			if current_buf_id ~= vim.api.nvim_win_get_buf(win_id) then
				return
			end

			-- Create new listed scratch buffer
			---@type integer
			local new_buf = vim.api.nvim_create_buf(true, true)
			vim.api.nvim_win_set_buf(win_id, new_buf)
		end)
	end

	vim.cmd.bdelete({ target_buf_id, bang = opts.force })
end

return {
	remove = remove,
}
