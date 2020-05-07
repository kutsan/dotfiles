" Comment and uncomment operator.
nnoremap <silent> gc :set operatorfunc=kutsan#mappings#operator#comment#<Enter>g@
xnoremap <silent> gc :<C-u>call kutsan#mappings#operator#comment#(visualmode())<Enter>

" Search and replace operator.
nnoremap <silent> gc* :set operatorfunc=kutsan#mappings#operator#searchreplace#<Enter>g@
xnoremap <silent> gc* :<C-u>call kutsan#mappings#operator#searchreplace#(visualmode())<Enter>

" `gq` wrapper that formats without moving cursor.
nnoremap <silent> gq :let w:gqview = winsaveview()<Enter>:set opfunc=kutsan#mappings#operator#format#<Enter>g@
