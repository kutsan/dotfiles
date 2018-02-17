""
" Set the variable to the default value, only if variable is not defined.
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
