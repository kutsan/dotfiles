" Make `cw` operation consistent by parting ways with `ce`.
onoremap w :<C-u>normal! vwh<Enter>
onoremap W :<C-u>normal! vWh<Enter>

" Send given motion to appropriate REPL operator.
nnoremap <silent> gx :let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#operator#execute#<Enter>g@
xnoremap <silent> gx :<C-u>call kutsan#mappings#operator#execute#(visualmode())<Enter>

" Comment and uncomment operator.
nnoremap <silent> gc :set operatorfunc=kutsan#mappings#operator#comment#<Enter>g@
xnoremap <silent> gc :<C-u>call kutsan#mappings#operator#comment#(visualmode())<Enter>

" Search and replace operator.
nnoremap <silent> gc* :set operatorfunc=kutsan#mappings#operator#searchreplace#<Enter>g@
xnoremap <silent> gc* :<C-u>call kutsan#mappings#operator#searchreplace#(visualmode())<Enter>
