local Plugin = { 'milanglacier/minuet-ai.nvim' }

Plugin.name = 'minuet'

Plugin.dependencies = {
	'plenary',
}

Plugin.opts = {
	provider = 'openai_fim_compatible',
	provider_options = {
		openai_fim_compatible = {
			model = 'mercury-edit',
			end_point = 'https://api.inceptionlabs.ai/v1/fim/completions',
			api_key = 'INCEPTION_API_KEY',
			stream = true,
		},
	},
	virtualtext = {
		auto_trigger_ft = { '*' },
		show_on_completion_menu = true,
		keymap = {
			accept = '<M-l>',
			prev = '<M-[>',
			next = '<M-]>',
			dismiss = '<M-e>',
		},
	},
}

return Plugin
