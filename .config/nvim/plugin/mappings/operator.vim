" Comment and uncomment operator.
nnoremap <silent> gc :set operatorfunc=kutsan#mappings#operator#comment#<CR>g@
xnoremap <silent> gc :<C-u>call kutsan#mappings#operator#comment#(visualmode())<CR>

" Search and replace operator.
nnoremap <silent> gy :set operatorfunc=kutsan#mappings#operator#searchreplace#<CR>g@
xnoremap <silent> gy :<C-u>call kutsan#mappings#operator#searchreplace#(visualmode())<CR>

" `gq` wrapper that formats without moving cursor.
nnoremap <silent> gq :let w:gqview = winsaveview()<CR>:set opfunc=kutsan#mappings#operator#format#gq<CR>g@
xnoremap <silent> gq :<C-u>call kutsan#mappings#operator#format#gq(visualmode())<CR>

" Use alternate 'formatprg' `par` via `gQ`.
nnoremap <silent> gQ :let w:gQview = winsaveview()<CR>:set opfunc=kutsan#mappings#operator#format#gQ<CR>g@
xnoremap <silent> gQ :<C-u>call kutsan#mappings#operator#format#gQ(visualmode())<CR>
