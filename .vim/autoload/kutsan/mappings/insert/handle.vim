""
" Go next and previous completion when popup menu is visible.
"
" inoremap <expr> <Tab> kutsan#mappings#insert#handle#tab({ 'key': "\<Tab>" })
" inoremap <expr> <S-Tab> kutsan#mappings#insert#handle#tab({ 'key': "\<S-Tab>" })
"
" @param {dictionary} options Configuration dictionary.
" @param {string} options.key Key to use, whether "\<Tab>" or "\<S-Tab>".
""
function! kutsan#mappings#insert#handle#tab(options) abort
	if !pumvisible()
		return a:options.key
	endif

	if a:options.key ==# "\<Tab>"
		return "\<C-n>"
	elseif a:options.key ==# "\<S-Tab>"
		return "\<C-p>"
	endif
endfunction
