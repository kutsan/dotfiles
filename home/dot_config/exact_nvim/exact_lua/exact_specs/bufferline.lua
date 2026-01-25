local Plugin = { 'akinsho/bufferline.nvim' }

Plugin.name = 'bufferline'
Plugin.version = '*'

Plugin.dependencies = {
	'devicons',
	'grapple',
}

Plugin.event = 'VeryLazy'
Plugin.keys = {
	{
		'<M-p>',
		'<cmd>BufferLineCyclePrev<cr>',
		desc = 'Prev Buffer',
	},
	{
		'<M-n>',
		'<cmd>BufferLineCycleNext<cr>',
		desc = 'Next Buffer',
	},
}

Plugin.opts = {
	options = {
		show_buffer_close_icons = false,
		show_close_icon = false,
		offsets = {
			{
				filetype = 'snacks_layout_box',
				highlight = 'Directory',
			},
			{
				filetype = 'NvimTree',
			},
		},
		name_formatter = function(buf)
			local mark = require('grapple').exists({ buffer = buf.bufnr }) and ' '
				or ''
			return mark .. buf.name
		end,
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
						{ text = '  ' .. error, link = 'DiagnosticError' }
					)
				end

				if warning ~= 0 then
					table.insert(
						result,
						{ text = '  ' .. warning, link = 'DiagnosticWarn' }
					)
				end

				if hint ~= 0 then
					table.insert(
						result,
						{ text = '  ' .. hint, link = 'DiagnosticHint' }
					)
				end

				if info ~= 0 then
					table.insert(
						result,
						{ text = '  ' .. info, link = 'DiagnosticInfo' }
					)
				end

				return result
			end,
		},
	},
}

return Plugin
