local Plugin = { 'jinh0/eyeliner.nvim' }

Plugin.name = 'eyeliner'

Plugin.config = function()
	local eyeliner = require('eyeliner')

	eyeliner.setup({
		highlight_on_key = true,
	})
end

return Plugin
