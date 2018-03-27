" Jump to the beginning and end of line.
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Jump previous and next commands from history.
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" Navigate left and right characters.
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Construct substitute with 'very magic' mode.
cnoremap <C-s>/ s/\v//gc<Left><Left><Left><Left>

" Move between matches without leaving incremental search.
cnoremap <expr> <Tab> getcmdtype() ==# '/' \|\| getcmdtype() ==# '?' ? '<Enter>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() ==# '/' \|\| getcmdtype() ==# '?' ? '<Enter>?<C-r>/' : '<S-Tab>'
