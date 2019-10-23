""
" Lookup definition under cursor.
"
" nnoremap <silent> gt :call kutsan#mappings#normal#lookup#()<Enter>
""
function! kutsan#mappings#normal#lookup#() abort
	let l:supportedfiletypes = [
		\ 'javascript',
		\ 'javascriptreact',
		\ 'css'
	\ ]

	if exists('g:did_coc_loaded') && index(l:supportedfiletypes, &filetype, 0, v:true) >= 0
		call CocAction('doHover')
	elseif !empty(&keywordprg)
		normal! K
	endif
endfunction
