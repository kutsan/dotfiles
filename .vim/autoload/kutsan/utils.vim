""
" Set the variable to the default value, only if variable is not defined.
"
" @param {string} var Variable name with its scope.
" @param {*} default Default value for variable.
""
function! kutsan#utils#set(var, default) abort
	if !exists(a:var)
		if type(a:default)
			execute 'let' a:var '=' string(a:default)
		else
			execute 'let' a:var '=' a:default
		endif
	endif
endfunction

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
