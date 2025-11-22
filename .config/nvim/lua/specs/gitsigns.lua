local Plugin = { 'lewis6991/gitsigns.nvim' }

Plugin.name = 'gitsigns'

Plugin.opts = {
	on_attach = function()
		local gitsigns = require('gitsigns')
		local keymap = vim.keymap

		keymap.set('n', '<Space>gb', gitsigns.blame, { silent = true })
	end,
}

Plugin.config = true

return Plugin
