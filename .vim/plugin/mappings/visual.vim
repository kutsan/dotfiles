" Stay in visual mode when indenting.
xnoremap < <gv
xnoremap > >gv

" Always search with 'very magic' mode.
xnoremap / /\v
xnoremap ? ?\v

" Execute a macro over visual selection.
xnoremap <silent> @ :<C-u>execute printf("'<,'>normal! @%s", nr2char(getchar()))<Enter>
