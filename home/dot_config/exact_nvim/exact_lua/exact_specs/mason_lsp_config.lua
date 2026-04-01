vim.pack.add({
	{
		name = 'mason-lsp-config',
		src = 'github:mason-org/mason-lspconfig.nvim',
	},
})

local mason_lsp_config = require('mason-lspconfig')

mason_lsp_config.setup()
