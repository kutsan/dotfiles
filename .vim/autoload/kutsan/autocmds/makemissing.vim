""
" Create directory path if it's not exist.
"
" autocmd BufWritePre * call kutsan#autocmds#makemissing#(expand('<afile>:p:h'), v:cmdbang)
"
" @param {string} directory Path of the missing directory to be created.
" @param {boolean} [force=v:false] Create missing directory without prompting anything.
""
function! kutsan#autocmds#makemissing#(directory, force) abort
	if empty(a:directory) || a:directory =~# '\v\c^\w+://' || isdirectory(a:directory)
		return v:false
	endif

	if !a:force
		echohl Question
		call inputsave()

		try
			let l:answer = input(
				\ printf(
					\ '"%s" does not exist. Create? (y/N): ',
					\ a:directory
				\ ),
				\ ''
			\ )

			if empty(l:answer) || l:answer ==? 'n'
				return v:false
			endif
		finally
			call inputrestore()
			echohl None
		endtry
	endif

	return mkdir(a:directory, 'p')
endfunction
