function! kutsan#mappings#toggleterminal() abort
	call kutsan#utils#set('g:terminal_buffer', 0)

	try
		execute 'buffer' g:terminal_buffer
		startinsert!
	catch
		enew
		call termopen('cd $PWD && $SHELL', { 'detach': 0 })

		let g:terminal_buffer = bufnr('')
	endtry
endfunction
