function! kutsan#settings#foldtext() abort
	let l:fs = v:foldstart

	while getline(l:fs) !~# '\w'
		let l:fs = nextnonblank(l:fs + 1)
	endwhile

	if l:fs > v:foldend
		let l:line = getline(v:foldstart)
	else
		let l:line = substitute(getline(l:fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	return
		\ repeat(repeat(' ', 4), v:foldlevel - 1)
		\ . '> '
		\ . matchstr(l:line, '\v\w.+\s\ze\{')
endfunction


