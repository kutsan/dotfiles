""
" Set current working directory to git root.
"
" autocmd VimEnter,BufEnter * call kutsan#autocmds#setroot#()
""
function! kutsan#autocmds#setroot#() abort
	let l:currentdir = escape(expand('%:p:h'), ' ')

	if !isdirectory(l:currentdir)
		return v:false
	endif

	let l:gitdir = finddir('.git', l:currentdir .. ';')
	let l:rootdir = fnameescape(fnamemodify(l:gitdir, ':h'))

	if l:rootdir !=# $HOME
		execute 'cd' l:rootdir
	endif
endfunction

"""
"" Open file explorer if argument list contains at least one directory.
""
"" autocmd VimEnter * call kutsan#autocmds#openexplorer#()
"""
"function! kutsan#autocmds#openexplorer#() abort
"	" TODO: Move this logic to setroot and delete this altogether.
"	" TODO: Also try to make it VimEnter-only for performance reasons.
"	let l:directory = expand('<amatch>')

"	if isdirectory(l:directory)
"		execute printf('cd %s', fnameescape(l:directory))
"	endif
"endfunction
