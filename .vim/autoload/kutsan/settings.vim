scriptencoding UTF-8

""
" Define the string to be displayed for a closed folds.
"
" set foldtext=kutsan#settings#foldtext()
""
function! kutsan#settings#foldtext() abort
	let l:lines = v:foldend - v:foldstart + 1
	let l:first = substitute(getline(v:foldstart), '\v *', '', '')
	let l:dashes = substitute(v:folddashes, '-', '', 'g')

	return ' ▵' . ' [' . l:lines . '] ' . l:first
endfunction
