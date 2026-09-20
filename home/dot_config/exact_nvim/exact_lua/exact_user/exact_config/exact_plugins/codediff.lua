vim.pack.add({
	{
		name = 'codediff',
		src = 'github:esmuellert/codediff.nvim',
		version = vim.version.range('*'),
	},
})

local codediff = require('codediff')

local opts = {
	explorer = {
		view_mode = 'tree',
	},
	keymaps = {
		view = {
			toggle_layout = '<leader>t',
		},
	},
}

codediff.setup(opts)

vim.keymap.set('n', '<Space>gd', function()
	vim.cmd.CodeDiff()
end, { silent = true, desc = 'Toggle codediff' })

vim.keymap.set('n', '<Space>gl', function()
	vim.cmd.CodeDiff({ 'history', '%' })
end, { silent = true, desc = 'File history (current file)' })

vim.keymap.set('x', '<Space>gl', function()
	local first_line = vim.fn.line('v')
	local last_line = vim.fn.line('.')

	if first_line > last_line then
		first_line, last_line = last_line, first_line
	end

	vim.cmd({
		cmd = 'CodeDiff',
		args = { 'history' },
		range = { first_line, last_line },
	})
end, { silent = true, desc = 'File history (selected lines)' })

vim.keymap.set('n', '<Space>gL', function()
	vim.cmd.CodeDiff({ 'history' })
end, { silent = true, desc = 'File history (all files)' })
