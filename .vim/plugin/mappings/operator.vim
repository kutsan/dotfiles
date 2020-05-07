" Comment and uncomment operator.
nnoremap <silent> gc :set operatorfunc=kutsan#mappings#operator#comment#<CR>g@
xnoremap <silent> gc :<C-u>call kutsan#mappings#operator#comment#(visualmode())<CR>

" Search and replace operator.
nnoremap <silent> gc* :set operatorfunc=kutsan#mappings#operator#searchreplace#<CR>g@
xnoremap <silent> gc* :<C-u>call kutsan#mappings#operator#searchreplace#(visualmode())<CR>

" `gq` wrapper that formats without moving cursor.
nnoremap <silent> gq :let w:gqview = winsaveview()<CR>:set opfunc=kutsan#mappings#operator#format#<CR>g@
