vim.pack.add({
	{
		name = 'treesitter-auto-tag',
		src = 'github:windwp/nvim-ts-autotag',
	},
})

local tree_sitter_auto_tag = require('nvim-ts-autotag')

tree_sitter_auto_tag.setup()
