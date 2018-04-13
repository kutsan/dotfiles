" Construct range operator.
nnoremap <silent> ! :<C-u>set operatorfunc=kutsan#mappings#exclamationoperator<Enter>g@

" Send given motion to appropriate REPL operator.
nnoremap <silent> gx :<C-u>let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#executeoperator<Enter>g@
xnoremap <silent> gx :<C-u>call kutsan#mappings#executeoperator(visualmode())<Enter>
nnoremap <silent> gxl :<C-u>let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#executeoperator <Bar> execute 'normal!' v:count 'g@_'<Enter>

" Comment and uncomment operator.
nnoremap <silent> gc :<C-u>set opfunc=kutsan#mappings#commentoperator<Enter>g@
xnoremap <silent> gc :<C-u>call kutsan#mappings#commentoperator(visualmode())<Enter>
