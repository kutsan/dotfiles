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

return Plugin
