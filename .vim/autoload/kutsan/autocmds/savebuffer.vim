""
" Save the current buffer while keeping marks.
"
" autocmd InsertLeave,TextChanged * nested call kutsan#autocmds#savebuffer#()
" autocmd FocusGained,BufEnter,CursorHold * silent! checktime
""
function! kutsan#autocmds#savebuffer#() abort
	if empty(&buftype)
		\ && !empty(bufname(''))
		\ && &filetype !=# 'gitcommit'
		let l:save = {
			\ 'marks': {
				\ "'[": getpos("'["),
				\ "']": getpos("']")
			\ }
		\ }

		silent! update

		" Update signify signs.
		if exists('g:loaded_signify')
			call sy#start()
		endif

		for [l:key, l:value] in items(l:save.marks)
			call setpos(l:key, l:value)
		endfor
	endif
endfunction
