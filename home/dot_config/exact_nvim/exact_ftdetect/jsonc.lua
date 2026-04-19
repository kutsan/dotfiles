vim.filetype.add({
	pattern = {
		['.*/%.zed/.*%.json'] = 'jsonc',
		['.*/zed/.*%.json'] = 'jsonc',
		['.*/Zed/.*%.json'] = 'jsonc',

		['.*/%.vscode/.*%.json'] = 'jsonc',
	},
})
