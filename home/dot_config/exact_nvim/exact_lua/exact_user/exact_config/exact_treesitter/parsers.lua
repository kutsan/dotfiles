vim.pack.add({
	{
		name = 'treesitter',
		src = 'github:nvim-treesitter/nvim-treesitter',
	},
})

local treesitter = require('nvim-treesitter')

treesitter.setup({
	install_dir = vim.fn.stdpath('data') .. '/site',
})

local parsers = {
	'arduino',
	'astro',
	'awk',
	'bash',
	'c',
	'comment',
	'cpp',
	'css',
	'csv',
	'diff',
	'dockerfile',
	'editorconfig',
	'git_config',
	'git_rebase',
	'gitattributes',
	'gitcommit',
	'gitignore',
	'gnuplot',
	'gpg',
	'graphql',
	'html',
	'http',
	'javascript',
	'jq',
	'jsdoc',
	'json',
	'json5',
	'ledger',
	'lua',
	'luadoc',
	'luap',
	'make',
	'markdown',
	'markdown_inline',
	'mermaid',
	'printf',
	'prisma',
	'query',
	'regex',
	'rust',
	'sql',
	'ssh_config',
	'toml',
	'tsx',
	'typescript',
	'vim',
	'vimdoc',
	'xml',
	'yaml',
}

vim.schedule(function()
	treesitter.install(parsers)
end)

-- Enable treesitter highlighting, folding, and indentation per filetype.
-- Auto-install missing parsers asynchronously on first encounter.
vim.api.nvim_create_autocmd('FileType', {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match) or args.match
		local buf = args.buf

		if not vim.treesitter.language.add(lang) then
			if vim.list_contains(treesitter.get_available(), lang) then
				treesitter.install({ lang })
			end

			return
		end

		vim.treesitter.start(buf, lang)

		vim.wo[0][0].foldmethod = 'expr'
		vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
