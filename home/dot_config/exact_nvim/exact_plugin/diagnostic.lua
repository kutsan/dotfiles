vim.diagnostic.config({
	severity_sort = true,
	float = {
		source = true,
		width = 80,
		border = 'single',
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '',
			[vim.diagnostic.severity.WARN] = '',
			[vim.diagnostic.severity.INFO] = '',
			[vim.diagnostic.severity.HINT] = '',
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
			[vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
			[vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
			[vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
		},
	},
})
