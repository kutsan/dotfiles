""
" Select an and in entire buffer.
"
" onoremap <silent> ie :<C-u>call kutsan#mappings#motion#entire#({ 'mode': 'i' })<Enter>
" xnoremap <silent> ie :<C-u>call kutsan#mappings#motion#entire#({ 'mode': 'i' })<Enter>
" onoremap <silent> ae :<C-u>call kutsan#mappings#motion#entire#({ 'mode': 'a' })<Enter>
" xnoremap <silent> ae :<C-u>call kutsan#mappings#motion#entire#({ 'mode': 'a' })<Enter>
"
" @param {dictionary} options Configuration dictionary.
" @param {string} options.mode Motion to select text, whether 'a' or 'i'.
""
function! kutsan#mappings#motion#entire#(options) abort
	normal! m'

	if a:options.mode ==# 'a'
		keepjumps normal! gg0VG

	elseif a:options.mode ==# 'i'
		keepjumps normal! gg0
		call search('\v\c^.', 'cW')
		let l:startpos = getpos('.')

		keepjumps normal! G$
		call search('\v\c^.', 'bcW')
		let l:endpos = getpos('.')

		call setpos('.', l:startpos)
		keepjumps normal! V
		call setpos('.', l:endpos)
	endif
endfunction
