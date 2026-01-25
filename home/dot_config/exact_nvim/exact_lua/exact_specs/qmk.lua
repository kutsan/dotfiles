local Plugin = { 'codethread/qmk.nvim' }

Plugin.name = 'qmk'

Plugin.opts = {
	name = 'LAYOUT_60_ansi',
	layout = {
		'x x x x x x x x x x x x x x',
		'x x x x x x x x x x x x x x',
		'x x x x x x x x x x x x x^x',
		'x^x x x x x x x x x x x x^x',
		'x x x _ _ xx^xx _ _ x x x x',
	},
}

return Plugin
