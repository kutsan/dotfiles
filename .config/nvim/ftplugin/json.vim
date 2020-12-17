" Define 'formatprg'.
let &l:formatprg = printf(
	\ '%s --parser "json-stringify"',
	\ !empty(glob('node_modules/prettier/bin-prettier.js'))
		\ ? 'node_modules/prettier/bin-prettier.js'
		\ : 'prettier'
\ )
