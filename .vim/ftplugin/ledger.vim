" Fix 'commentstring'.
setlocal commentstring=;\ %s

" Add '-' to 'iskeyword' list.
setlocal iskeyword+=-

" Add new ledger entry with snippets.
nnoremap <buffer><silent> <LocalLeader>a :call kutsan#ftplugin#ledger#add()<Enter>
