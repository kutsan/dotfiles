local Plugin = { 'nvim-mini/mini.indentscope' }

Plugin.name = 'mini-indentscope'
Plugin.version = '*'

Plugin.event = { 'BufReadPost', 'BufNewFile' }

Plugin.config = function()
	local mini_indentscope = require('mini.indentscope')

	mini_indentscope.setup({
		draw = {
			predicate = function()
				return false
			end,
		},
	})
end

return Plugin
