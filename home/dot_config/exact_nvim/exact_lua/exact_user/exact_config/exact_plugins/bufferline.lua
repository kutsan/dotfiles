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
		custom_areas = {
			right = function()
				local result = {}
				local severity = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = severity.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = severity.WARN })
				local info = #vim.diagnostic.get(0, { severity = severity.INFO })
				local hint = #vim.diagnostic.get(0, { severity = severity.HINT })

				if error ~= 0 then
					table.insert(
						result,
						{ text = '  ' .. error, link = 'DiagnosticError' }
					)
				end

				if warning ~= 0 then
					table.insert(
						result,
						{ text = '  ' .. warning, link = 'DiagnosticWarn' }
					)
				end

				if hint ~= 0 then
					table.insert(result, { text = '  ' .. hint, link = 'DiagnosticHint' })
				end

				if info ~= 0 then
					table.insert(result, { text = '  ' .. info, link = 'DiagnosticInfo' })
				end

				return result
			end,
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
