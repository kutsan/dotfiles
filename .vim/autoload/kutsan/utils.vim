""
" Return true if current buffer has given regex.
"
" @param {string} regex Regular expression to be used in search.
" @param {number} max Maximum line number to be searched from top, as max. 500.
""
function! kutsan#utils#contains(regex, max) abort
	let l:ncurrent = 1

	if exists(a:max)
		let l:nend = a:max
	else
		let l:nend = line('$')
	endif

	if l:nend > 500
		let l:nend = 500
	endif

	while l:ncurrent < l:nend
		if getline(l:ncurrent) =~# a:regex
			return 1
			break
		endif

		let l:ncurrent += 1
	endwhile

	return 0
endfunction
