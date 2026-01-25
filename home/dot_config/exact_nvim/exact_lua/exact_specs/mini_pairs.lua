local Plugin = { 'nvim-mini/mini.pairs' }

Plugin.name = 'mini-pairs'
Plugin.version = '*'

Plugin.event = { 'InsertEnter', 'CmdlineEnter' }

Plugin.config = function()
	local mini_pairs = require('mini.pairs')

	mini_pairs.setup({
		modes = { insert = true, command = true },
	})
end

return Plugin
