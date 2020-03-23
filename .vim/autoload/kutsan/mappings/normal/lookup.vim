""
" Lookup definition under cursor.
"
" nnoremap <silent> gt :call kutsan#mappings#normal#lookup#()<Enter>
""
function! kutsan#mappings#normal#lookup#() abort
	if !empty(&keywordprg)
		normal! K
	else
		call CocAction('doHover')
	endif
endfunction
