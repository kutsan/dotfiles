" Fix 'commentstring'.
setlocal commentstring=;\ %s

" Add new ledger entry with snippets.
nnoremap <buffer><silent> <LocalLeader>a :call kutsan#ftplugin#ledger#add()<Enter>
