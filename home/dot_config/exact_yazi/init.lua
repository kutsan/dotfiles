local session = require('session')
local git = require('git')
local zoxide = require('zoxide')

session:setup({
	sync_yanked = true,
})

git:setup({
	order = 1500,
})

zoxide:setup({
	update_db = true,
})
