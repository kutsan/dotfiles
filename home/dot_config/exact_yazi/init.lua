local session = require('session')
local git = require('git')
local zoxide = require('zoxide')
local folder_rules = require('folder-rules')

session:setup({
	sync_yanked = true,
})

git:setup({
	order = 1500,
})

zoxide:setup({
	update_db = true,
})

folder_rules:setup()
