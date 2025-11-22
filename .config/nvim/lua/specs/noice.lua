local Plugin = { 'folke/noice.nvim' }

Plugin.name = 'noice'

Plugin.dependencies = { 'nui' }
Plugin.event = 'VeryLazy'

Plugin.opts = {
	lsp = {
		override = {
			['vim.lsp.util.convert_input_to_markdown_lines'] = true,
			['vim.lsp.util.stylize_markdown'] = true,
			['cmp.entry.get_documentation'] = true,
		},
		signature = {
			enabled = false,
		},
		documentation = {
			enabled = false,
		},
	},
	popupmenu = {
		win_options = {
			winhighlight = {
				Normal = 'NormalFloat',
				FloatBorder = 'FloatBorder',
			},
		},
	},
	presets = {
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
}

return Plugin
