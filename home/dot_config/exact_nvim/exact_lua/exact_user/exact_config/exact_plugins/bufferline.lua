vim.pack.add({
	{
		name = 'bufferline',
		src = 'github:akinsho/bufferline.nvim',
		version = vim.version.range('4'),
	},
})

local bufferline = require('bufferline')

local opts = {
	options = {
		show_buffer_close_icons = false,
		show_close_icon = false,
		indicator = { style = 'underline' },
		separator_style = { '', '' },
		diagnostics = 'nvim_lsp',
		style_preset = {
			bufferline.style_preset.no_italic,
			bufferline.style_preset.no_bold,
		},
		offsets = {
			{
				filetype = 'snacks_layout_box',
				highlight = 'Directory',
			},
		},
	},
}

bufferline.setup(opts)

vim.keymap.set(
	'n',
	'<S-M-[>',
	'<cmd>BufferLineCyclePrev<cr>',
	{ desc = 'Previous buffer' }
)
vim.keymap.set(
	'n',
	'<S-M-]>',
	'<cmd>BufferLineCycleNext<cr>',
	{ desc = 'Next buffer' }
)
