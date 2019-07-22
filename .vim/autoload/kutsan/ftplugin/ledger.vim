""
" Add new ledger entry.
"
" nnoremap <buffer><silent> <LocalLeader>a :call kutsan#ftplugin#ledger#add()<Enter>
""
function kutsan#ftplugin#ledger#add() abort
	" Move cursor to last non-empty line.
	keepjumps normal! G$
	call search('\v\c^.', 'bcW')

	" Insert 2 spaces below.
	silent put =repeat(nr2char(10), 2)

	" Center around screen.
	normal! zz

	" Expand the related snippet.
	silent execute "normal! iadd\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<Enter>"
endfunction
