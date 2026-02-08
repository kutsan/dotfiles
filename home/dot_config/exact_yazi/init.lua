local session = require('session')
local git = require('git')

session:setup({
	sync_yanked = true,
})

git:setup({
	order = 1500,
})
