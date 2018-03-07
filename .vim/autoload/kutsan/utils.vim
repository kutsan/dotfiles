""
" Return true if current buffer has given regex.
"
" @param {string} regex Regular expression to be used in search.
" @param {object} options Configuration object.
" @param {object} options.maxline Maximum line number to be searched from top,
" as 500 maximum.
""
function! kutsan#utils#contains(regex, ...) abort
	let l:options = get(a:, '1', {})

	let l:nend = get(l:options, 'maxline', line('$'))

	if l:nend > 500
		let l:nend = 500
	endif

	let l:ncurrent = 1

	while l:ncurrent < l:nend
		if getline(l:ncurrent) =~# a:regex
			return v:true
			break
		endif

		let l:ncurrent += 1
	endwhile

	return v:false
endfunction
