vim.pack.add({
	-- `catppuccin` is used only as a backend for Poisonbloom. Its default palette is not used.
	{
		name = 'catppuccin',
		src = 'github:catppuccin/nvim',
	},
})

local catppuccin = require('catppuccin')

local poisonbloom = {
	dark = {
		crust = '#050505',
		mantle = '#0e0f12',
		base = '#080808',

		surface0 = '#14161b',
		surface1 = '#22262e',
		surface2 = '#363f4e',
		overlay0 = '#606876',
		overlay1 = '#6a7282',
		overlay2 = '#737b8b',
		subtext0 = '#9ca3b0',
		subtext1 = '#b3b8c2',
		text = '#c9cdd4',

		red = '#c8939c',
		maroon = '#dab4ba',
		flamingo = '#c9a6bd',
		rosewater = '#b4c2da',
		peach = '#c6ad9f',
		yellow = '#c6bf9f',
		green = '#90c1ac',
		teal = '#afd4c5',
		sky = '#95bec6',
		sapphire = '#b5d3d9',
		blue = '#93a6c8',
		lavender = '#b4c2da',
		mauve = '#b89dc8',
		pink = '#ceb9d9',
	},

	light = {
		crust = '#e3e5e8',
		mantle = '#ebedef',
		base = '#f5f5f5',

		surface0 = '#dddfe3',
		surface1 = '#cacdd3',
		surface2 = '#b6bac3',
		overlay0 = '#848d9f',
		overlay1 = '#707a8f',
		overlay2 = '#60697b',
		subtext0 = '#484e5b',
		subtext1 = '#3d424d',
		text = '#31363f',

		red = '#8d4c57',
		maroon = '#763a44',
		flamingo = '#874c74',
		rosewater = '#384d71',
		peach = '#7b5742',
		yellow = '#695f39',
		green = '#386955',
		teal = '#2a5443',
		sky = '#3b666e',
		sapphire = '#2c525a',
		blue = '#496088',
		lavender = '#384d71',
		mauve = '#794e92',
		pink = '#643c7a',
	},
}

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
