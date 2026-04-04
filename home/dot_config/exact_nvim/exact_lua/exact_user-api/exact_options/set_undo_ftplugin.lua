---@param cmds string[]
local function set_undo_ftplugin(cmds)
	local undo_cmd = table.concat(cmds, ' | ')

	if vim.b.undo_ftplugin ~= nil then
		undo_cmd = vim.b.undo_ftplugin .. ' | ' .. undo_cmd
	end

	vim.b.undo_ftplugin = undo_cmd
end

return { set_undo_ftplugin = set_undo_ftplugin }
