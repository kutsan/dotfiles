""
" Lookup definition under cursor.
"
" nnoremap <silent> gt :call kutsan#mappings#normal#lookup#()<Enter>
""
function! kutsan#mappings#normal#lookup#() abort
	if !empty(&keywordprg)
		normal! K
	else
		if exists('g:did_coc_loaded')
			call CocAction('doHover')
		endif
	endif
endfunction
