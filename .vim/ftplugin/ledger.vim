" Fix 'commentstring'.
setlocal commentstring=;\ %s

" Add '-' to 'iskeyword' list.
setlocal iskeyword+=-

" Add new ledger entry.
inoreabbrev <silent> add <C-r>=strftime('%F')<CR>
