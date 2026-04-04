vim.pack.add({
	{
		name = 'copilot',
		src = 'github:zbirenbaum/copilot.lua',
	},
})

local copilot = require('copilot')

local opts = {
	panel = { enabled = false },
	suggestion = {
		auto_trigger = true,
		keymap = {
			accept_word = '<M-w>',
		},
	},
	filetypes = {
		gitcommit = true,
		markdown = true,
	},
}

copilot.setup(opts)
