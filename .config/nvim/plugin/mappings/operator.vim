" Comment and uncomment operator.
nnoremap <silent> gc :set operatorfunc=kutsan#mappings#operator#comment#<CR>g@
xnoremap <silent> gc :<C-u>call kutsan#mappings#operator#comment#(visualmode())<CR>
