---@return nil
local function select_entire_buffer()
	vim.cmd.normal({ "m'", bang = true })
	vim.cmd.normal({ 'gg0VoG', bang = true, mods = { keepjumps = true } })
end

return { select_entire_buffer = select_entire_buffer }
