---@return string
local function generate_foldtext()
	---@type string
	local start_line = vim.api.nvim_buf_get_lines(
		0,
		vim.v.foldstart - 1,
		vim.v.foldstart,
		false
	)[1] or ''
	---@type string
	local end_line = vim.api.nvim_buf_get_lines(
		0,
		vim.v.foldend - 1,
		vim.v.foldend,
		false
	)[1] or ''

	start_line = start_line:gsub('\t', string.rep(' ', vim.o.tabstop))
	end_line = vim.trim(end_line)

	return start_line .. ' ... ' .. end_line
end

return { generate_foldtext = generate_foldtext }
