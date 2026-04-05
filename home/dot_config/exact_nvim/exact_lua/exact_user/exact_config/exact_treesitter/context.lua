vim.pack.add({
	{
		name = 'treesitter-context',
		src = 'github:nvim-treesitter/nvim-treesitter-context',
	},
})

local tree_sitter_context = require('treesitter-context')

tree_sitter_context.setup({
	max_lines = 3,
})
