""
" `gq` wrapper that formats without moving cursor.
"
" nnoremap <silent> gq :let w:gqview = winsaveview()<CR>:set opfunc=kutsan#mappings#operator#format#<CR>g@
""
function! kutsan#mappings#operator#format#(type) abort
	normal! '[v']gq

	call winrestview(w:gqview)

	unlet w:gqview
endfunction
