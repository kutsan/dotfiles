vim.pack.add({
	{
		name = 'todo-comments',
		src = 'github:folke/todo-comments.nvim',
	},
})

local todo_comments = require('todo-comments')

todo_comments.setup()
