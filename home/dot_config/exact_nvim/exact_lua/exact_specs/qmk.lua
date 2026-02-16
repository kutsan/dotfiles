local Plugin = { 'codethread/qmk.nvim' }

Plugin.name = 'qmk'

Plugin.opts = {
	name = 'LAYOUT_60_ansi',
	comment_preview = {
		position = 'none',
	},
	layout = {
		'x x x x x x x x x x x x x x',
		'x x x x x x x x x x x x x x',
		'x x x x x x x x x x x x x^x',
		'x^x x x x x x x x x x x x^x',
		'x x x _ _ xx^xx _ _ x x x x',
	},
}

return Plugin
