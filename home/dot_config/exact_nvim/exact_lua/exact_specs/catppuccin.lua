local Plugin = { 'catppuccin/nvim' }

Plugin.name = 'catppuccin'

Plugin.lazy = false
Plugin.priority = 1000

Plugin.opts = {
	flavour = 'auto',
	background = {
		dark = 'mocha',
		light = 'latte',
	},
	no_bold = true,
	term_colors = true,
	color_overrides = {
		mocha = {
			base = '#0f1119',
			mantle = '#090b10',
			crust = '#171b26',
		},
	},
	highlight_overrides = {
		all = function(colors)
			local utils = require('catppuccin/utils/colors')

			return {
				-- Built-in highlights
				Whitespace = { fg = utils.darken(colors.surface0, 0.4, colors.base) },
				LspInlayHint = {
					fg = colors.overlay0,
					bg = 'NONE',
					style = { 'italic' },
				},
				Folded = {
					fg = colors.overlay0,
					bg = 'NONE',
					style = { 'italic' },
				},
				DiffAdd = { bg = utils.darken(colors.green, 0.1, colors.base) },
				DiffChange = { bg = utils.darken(colors.blue, 0.1, colors.base) },
				DiffText = { bg = utils.darken(colors.blue, 0.3, colors.base) },
				DiffDelete = { bg = utils.darken(colors.red, 0.1, colors.base) },

				-- treesitter: TypeScript with JSX
				['@constructor.tsx'] = { fg = colors.yellow },
				['@tag.tsx'] = { fg = colors.red },

				-- snacks
				SnacksPickerTree = {
					fg = utils.darken(colors.surface0, 0.7, colors.base),
				},
			}
		end,
	},
	integrations = {
		diffview = true,
		treesitter = true,
		treesitter_context = true,
		blink_cmp = {
			enabled = true,
		},
		gitsigns = true,
		noice = true,
		snacks = {
			enabled = true,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { 'italic' },
				hints = { 'italic' },
				warnings = { 'italic' },
				information = { 'italic' },
			},
			underlines = {
				errors = { 'undercurl' },
				hints = { 'undercurl' },
				warnings = { 'undercurl' },
				information = { 'undercurl' },
			},
		},
	},
}

Plugin.config = function(_, opts)
	local catppuccin = require('catppuccin')
	catppuccin.setup(opts)

	vim.cmd.colorscheme('catppuccin')
end

return Plugin
