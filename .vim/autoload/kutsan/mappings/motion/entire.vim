""
" Select an entire buffer.
"
" onoremap <silent> ae :<C-u>call kutsan#mappings#motion#entire#()<Enter>
" xnoremap <silent> ae :<C-u>call kutsan#mappings#motion#entire#()<Enter>
""
function! kutsan#mappings#motion#entire#() abort
	normal! m'

	keepjumps normal! gg0VG
endfunction
