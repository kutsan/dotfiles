---@type table<integer, fun()[]>
local callbacks = {}

vim.api.nvim_create_autocmd('BufWipeout', {
	group = vim.api.nvim_create_augroup('UndoFtplugin', { clear = true }),
	callback = function(args)
		callbacks[args.buf] = nil
	end,
})

---@param bufnr integer
local function undo_ftplugin(bufnr)
	for _, callback in ipairs(callbacks[bufnr] or {}) do
		callback()
	end

	callbacks[bufnr] = nil
end

---@param callback fun()
local function set_undo_ftplugin(callback)
	---@type integer
	local bufnr = vim.api.nvim_get_current_buf()

	if callbacks[bufnr] == nil then
		callbacks[bufnr] = {}

		---@type string
		local undo_command = string.format(
			"lua require('user.api.options.set_undo_ftplugin').undo_ftplugin(%d)",
			bufnr
		)

		---@type string?
		local existing_undo_command = vim.b.undo_ftplugin

		if existing_undo_command ~= nil then
			undo_command = existing_undo_command .. ' | ' .. undo_command
		end

		vim.b.undo_ftplugin = undo_command
	end

	table.insert(callbacks[bufnr], callback)
end

return {
	set_undo_ftplugin = set_undo_ftplugin,
	undo_ftplugin = undo_ftplugin,
}
