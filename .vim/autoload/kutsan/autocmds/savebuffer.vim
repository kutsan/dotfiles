""
" Save the current buffer while keeping marks.
"
" autocmd InsertLeave,TextChanged * nested call kutsan#autocmds#savebuffer#()
" autocmd FocusGained,BufEnter,CursorHold * silent! checktime
""
function! kutsan#autocmds#savebuffer#() abort
	if empty(&buftype) && !empty(bufname(''))
		let l:save = {
			\ 'marks': {
				\ "'[": getpos("'["),
				\ "']": getpos("']")
			\ }
		\ }

		silent! update

		for [l:key, l:value] in items(l:save.marks)
			call setpos(l:key, l:value)
		endfor
	endif
endfunction
