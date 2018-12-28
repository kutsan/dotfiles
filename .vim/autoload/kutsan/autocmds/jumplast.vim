""
" Jump to last known position and center buffer around cursor.
"
" autocmd BufReadPost *? call kutsan#autocmds#jumplast#()
""
function! kutsan#autocmds#jumplast#() abort
	if empty(&buftype) && index(['diff', 'gitcommit'], &filetype, 0, v:true) == -1
		if line("'\"") >= 1 && line("'\"") <= line('$')
			execute 'normal! g`"zz'
		endif
	endif
endfunction
