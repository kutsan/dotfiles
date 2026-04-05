---@return string
local function generate_foldtext()
	---@type string
	local start_line = vim.fn.getline(vim.v.foldstart)
	---@type string
	local end_line = vim.fn.getline(vim.v.foldend)

	start_line = start_line:gsub('\t', string.rep(' ', vim.o.tabstop))
	end_line = vim.trim(end_line)

	return start_line .. ' ... ' .. end_line
end

return { generate_foldtext = generate_foldtext }
