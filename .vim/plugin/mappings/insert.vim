" Go next and previous completion when popup menu is visible.
inoremap <expr> <Tab> kutsan#mappings#insert#handle#tab({ 'key': "\<Tab>" })
inoremap <expr> <S-Tab> kutsan#mappings#insert#handle#tab({ 'key': "\<S-Tab>" })
