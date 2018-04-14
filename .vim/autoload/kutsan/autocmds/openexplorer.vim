""
" Open file explorer if argument list contains at least one directory.
"
" autocmd VimEnter * call kutsan#autocmds#openexplorer#main()
""
function! kutsan#autocmds#openexplorer#main() abort
	let l:directory = expand('<amatch>')

	if isdirectory(l:directory)
		execute printf('cd %s', fnameescape(l:directory))

		if exists(':NERDTree')
			NERDTree
			only
		endif
	endif
endfunction
