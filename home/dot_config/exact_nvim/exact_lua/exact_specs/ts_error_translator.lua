vim.pack.add({
	{
		name = 'ts-error-translator',
		src = 'github:dmmulroy/ts-error-translator.nvim',
	},
})

local ts_error_translator = require('ts-error-translator')

ts_error_translator.setup()
