--
-- Select an entire buffer.
--
-- keymap.set({ 'o', 'x' }, 'ae', function()
--   local entire = require('user/entire')
--   entire.select_entire_buffer()
-- end, { silent = true })
--
local function select_entire_buffer()
	vim.cmd.normal({ "m'", bang = true })
	vim.cmd('keepjumps normal! gg0VoG')
end

return { select_entire_buffer = select_entire_buffer }
