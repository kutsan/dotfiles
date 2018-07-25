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

""
" Accept completion or expand snippet when popup menu is visible.
"
" inoremap <expr> <Enter> kutsan#mappings#insert#handle#enter()
""
function! kutsan#mappings#insert#handle#enter() abort
	if !pumvisible()
		return "\<Enter>"
	endif

	if exists('g:loaded_neosnippet') && neosnippet#expandable()
		return neosnippet#mappings#expand_impl()
	else
		return "\<C-y>"
	endif
endfunction
