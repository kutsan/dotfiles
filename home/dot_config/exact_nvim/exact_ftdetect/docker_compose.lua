vim.filetype.add({
	pattern = {
		['docker%-compose.*%.ya?ml'] = 'yaml.docker-compose',
		['compose.*%.yaml'] = 'yaml.docker-compose',
	},
})
