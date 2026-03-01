local Plugin = { 'stevearc/conform.nvim' }

Plugin.name = 'conform'

local prettier_formatters = {
	'prettierd',
	'prettier',
	stop_after_first = true,
}

Plugin.opts = {
	formatters_by_ft = {
		lua = { 'stylua' },
		javascript = prettier_formatters,
		typescript = prettier_formatters,
		typescriptreact = prettier_formatters,
		yaml = prettier_formatters,
		json = prettier_formatters,
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = 'fallback',
	},
}

Plugin.config = function(_, opts)
	local conform = require('conform')

	conform.setup(opts)

	vim.keymap.set('n', '\\f', function()
		conform.format({
			async = true,
			lsp_format = 'fallback',
		})
	end)

	vim.keymap.set('x', '\\f', function()
		local start_line = vim.fn.line('v')
		local end_line = vim.fn.line('.')

		if start_line > end_line then
			start_line, end_line = end_line, start_line
		end

		local last_line =
			vim.api.nvim_buf_get_lines(0, end_line - 1, end_line, true)[1]

		conform.format({
			async = true,
			lsp_format = 'fallback',
			range = {
				start = { start_line, 0 },
				['end'] = { end_line, last_line:len() },
			},
		})
	end)
end

return Plugin
