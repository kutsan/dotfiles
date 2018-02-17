""
" Switch to the available terminal buffer, if there is one. Otherwise create a new
" terminal in place of current buffer.
""
function! kutsan#mappings#toggleterminal() abort
	call kutsan#utils#set('g:terminalbuffer', 0)

	try
		execute 'buffer' g:terminalbuffer
		startinsert
	catch
		enew
		call termopen('cd "$PWD" && $SHELL', { 'detach': 0 })

		let g:terminalbuffer = bufnr('')
	endtry
endfunction
