""
" `gq` wrapper that formats without moving cursor.
"
" nnoremap <silent> gq :let w:gqview = winsaveview()<Enter>:set opfunc=kutsan#mappings#operator#format#<Enter>g@
""
function! kutsan#mappings#operator#format#(type) abort
	normal! '[v']gq

	call winrestview(w:gqview)

	unlet w:gqview
endfunction
