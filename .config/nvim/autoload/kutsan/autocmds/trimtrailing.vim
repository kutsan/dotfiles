" vint: -ProhibitCommandWithUnintendedSideEffect -ProhibitCommandRelyOnUser

""
" Trim trailing whitespace characters from end of each line.
"
" autocmd BufWritePre * call kutsan#autocmds#trimtrailing#()
""
function! kutsan#autocmds#trimtrailing#() abort
	if &l:modifiable && !&l:binary
		let l:view = winsaveview()

		try
			keeppatterns silent! 1,$substitute/\s\+$//e
		finally
			call winrestview(l:view)
		endtry
	endif
endfunction
