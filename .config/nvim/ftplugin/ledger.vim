" Fix 'commentstring'.
setlocal commentstring=;\ %s

" Add '-' to 'iskeyword' list.
setlocal iskeyword+=-

" Add new ledger entry.
nnoremap <buffer><silent> <LocalLeader>a :call kutsan#ftplugin#ledger#add()<CR>
