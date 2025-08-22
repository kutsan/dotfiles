-- Help files.
vim.filetype.add({ pattern = { ['.*/doc/.-%.txt'] = 'help' } })
vim.filetype.add({ pattern = { ['.*/doc/.-%.txt'] = 'help' } })

-- .env files.
vim.filetype.add({ pattern = { ['.env.*'] = 'config' } })

-- Git configs.
vim.filetype.add({ pattern = { ['.*%.gitconfig'] = 'gitconfig' } })

-- Docker Compose files.
vim.filetype.add({
  pattern = {
    ['docker%-compose.*%.ya?ml'] = 'yaml.docker-compose',
    ['compose.*%.yaml'] = 'yaml.docker-compose',
  },
})
