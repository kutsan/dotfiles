" Define 'formatprg'.
let &l:formatprg = printf(
	\ '%s --parser "json"',
	\ !empty(glob('node_modules/.bin/prettier'))
		\ ? 'node_modules/.bin/prettier'
		\ : 'prettier'
\ )
