" Construct range operator.
nnoremap <silent> ! :<C-u>set operatorfunc=kutsan#mappings#operator#exclamation#main<Enter>g@

" Send given motion to appropriate REPL operator.
nnoremap <silent> gx :<C-u>let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#operator#execute#main<Enter>g@
xnoremap <silent> gx :<C-u>call kutsan#mappings#operator#execute#main(visualmode())<Enter>
nnoremap <silent> gxl :<C-u>let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#operator#execute#main <Bar> execute 'normal!' v:count 'g@_'<Enter>

" Comment and uncomment operator.
nnoremap <silent> gc :<C-u>set opfunc=kutsan#mappings#operator#comment#main<Enter>g@
xnoremap <silent> gc :<C-u>call kutsan#mappings#operator#comment#main(visualmode())<Enter>
