local Plugin = { 'saghen/blink.cmp' }

Plugin.version = '1.*'

Plugin.event = 'InsertEnter'

Plugin.opts = {
	keymap = {
		preset = 'none',
		['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
		['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-n>'] = { 'show', 'select_next', 'fallback' },
		['<C-p>'] = { 'show', 'select_prev', 'fallback' },
		['<C-Space>'] = { 'show' },
		['<C-e>'] = { 'hide', 'fallback' },
		['<CR>'] = { 'accept', 'fallback' },
		['<Tab>'] = { 'select_next', 'fallback' },
		['<S-Tab>'] = { 'select_prev', 'fallback' },
	},
	completion = {
		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},
		documentation = {
			auto_show = true,
			window = {
				max_width = 60,
				max_height = 15,
			},
		},
		menu = {
			draw = {
				columns = {
					{ 'kind_icon' },
					{ 'label', gap = 1 },
				},
			},
		},
	},
	signature = {
		enabled = true,
	},
	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
	},
	fuzzy = {
		implementation = 'prefer_rust_with_warning',
	},
}

Plugin.opts_extend = { 'sources.default' }

return Plugin
