" Go next and previous completion when popup menu is visible.
inoremap <silent><expr> <Tab> kutsan#mappings#insert#handle#tab({ 'key': "\<Tab>" })
inoremap <silent><expr> <S-Tab> kutsan#mappings#insert#handle#tab({ 'key': "\<S-Tab>" })
