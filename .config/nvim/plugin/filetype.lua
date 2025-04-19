-- Help files.
vim.filetype.add({ pattern = { ['.*/doc/.-%.txt'] = 'help' } })
vim.filetype.add({ pattern = { ['.*/doc/.-%.txt'] = 'help' } })

-- .env files.
vim.filetype.add({ pattern = { ['.env.*'] = 'config' } })
