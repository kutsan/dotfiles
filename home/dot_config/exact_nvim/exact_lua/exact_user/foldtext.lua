local function foldtext()
	local start_line = vim.fn.getline(vim.v.foldstart)
	local end_line = vim.fn.getline(vim.v.foldend)

	start_line = start_line:gsub('\t', string.rep(' ', vim.o.tabstop))
	end_line = vim.trim(end_line)

	return start_line .. ' ... ' .. end_line
end

return { foldtext = foldtext }
