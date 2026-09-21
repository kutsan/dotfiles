vim.pack.add({
	-- `catppuccin` is used only as a backend for Poisonbloom.
	{
		name = 'catppuccin',
		src = 'github:catppuccin/nvim',
	},
})

local catppuccin = require('catppuccin')
local poisonbloom = require('user.config.colorschemes.poisonbloom_palette')

local opts = {
	flavour = 'auto',
	background = {
		dark = 'mocha',
		light = 'latte',
	},
	no_bold = true,
	color_overrides = {
		latte = poisonbloom.light,
		mocha = poisonbloom.dark,
	},
	highlight_overrides = {
		all = function(colors)
			local utils = require('catppuccin/utils/colors')

			return {
				-- Built-in highlights
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
				CurSearch = {
					bg = utils.darken(colors.sky, 0.4, colors.base),
					fg = colors.text,
				},

				-- Plugin `snacks`
				SnacksIndentScope = {
					fg = utils.darken(colors.overlay0, 0.4, colors.base),
				},

				-- Plugin `codediff`
				NeoTreeIndentMarker = {
					fg = utils.darken(colors.overlay0, 0.2, colors.base),
				},
				CodeDiffFiller = {
					fg = utils.darken(colors.overlay0, 0.2, colors.base),
				},
			}
		end,
	},
	integrations = {
		treesitter = true,
		treesitter_context = true,
		blink_cmp = {
			enabled = true,
		},
		gitsigns = true,
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

catppuccin.setup(opts)
