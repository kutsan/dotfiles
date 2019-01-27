""
" Select an entire buffer.
"
" onoremap <silent> ae :call kutsan#mappings#motion#entire#a()<Enter>
" xnoremap <silent> ae :<C-u>call kutsan#mappings#motion#entire#a()<Enter>
""
function! kutsan#mappings#motion#entire#a()
	normal! m'

	keepjumps normal! gg0VG
endfunction

""
" Select in entire buffer.
"
" onoremap <silent> ie :call kutsan#mappings#motion#entire#i()<Enter>
" xnoremap <silent> ie :<C-u>call kutsan#mappings#motion#entire#i()<Enter>
""
function! kutsan#mappings#motion#entire#i()
	normal! m'

	keepjumps normal! gg0
	call search('\v\c^.', 'cW')
	let l:startpos = getpos('.')

	keepjumps normal! G$
	call search('\v\c^.', 'bcW')
	let l:endpos = getpos('.')

	call setpos('.', l:startpos)
	keepjumps normal! V
	call setpos('.', l:endpos)
endfunction
