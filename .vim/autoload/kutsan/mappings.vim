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

""
" Construct the range with given motion. Emulates `!` (exclamation) operator
" without putting '!' symbol automatically in the command mode.
"
" nnoremap <silent> ! :<C-u>set operatorfunc=kutsan#mappings#exclamationoperator<CR>g@
""
function! kutsan#mappings#exclamationoperator(type) abort
	let [l:mstart, l:mend] = [line("'["), line("']")]

	if l:mstart == line('.')
		let [l:mstart, l:mend] = ['.', '.+' . (l:mend - l:mstart)]
	endif

	call feedkeys(':' . l:mstart . ',' . l:mend, 'in')
endfunction
