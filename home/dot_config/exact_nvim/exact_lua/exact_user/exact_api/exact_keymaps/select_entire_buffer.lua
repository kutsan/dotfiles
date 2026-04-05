---@return nil
local function select_entire_buffer()
	vim.cmd.normal({ "m'", bang = true })
	vim.cmd('keepjumps normal! gg0VoG')
end

return { select_entire_buffer = select_entire_buffer }
