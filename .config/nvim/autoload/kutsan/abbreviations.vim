""
" Insert shebang string according to filetype.
"
" inoreabbrev <expr> _#! kutsan#abbreviations#shebang()
"
" @return {shebang} Shebang string, with or without interpreter.
""
function! kutsan#abbreviations#shebang() abort
	if empty(&filetype)
		return '#!/usr/bin/env'
	endif

	let l:interpreters = {
		\ 'javascript': 'node',
		\ 'sh': 'bash'
	\ }

	return printf(
		\ '#!/usr/bin/env %s',
		\ get(l:interpreters, split(&filetype, '\v\c\.')[0], &filetype)
	\ )
endfunction
