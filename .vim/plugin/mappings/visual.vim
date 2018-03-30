" Stay in visual mode when indenting.
xnoremap < <gv
xnoremap > >gv

" Alternative end and beginning of line shortcuts.
xnoremap H ^
xnoremap L g_

" Always search with 'very magic' mode.
xnoremap / /\v
xnoremap ? ?\v

" Use `s` for registers.
xnoremap s "

" Execute macro 'q' over visual line selections.
xnoremap Q :'<,'>normal! @q<Enter>

" Bubble lines in visual line mode, jump in character-wise visual mode.
xnoremap <expr> J mode() ==# 'V' ? ":move '>+1<Enter>gv=gv" : '5j'
xnoremap <expr> K mode() ==# 'V' ? ":move '<-2<Enter>gv=gv" : '5k'

" Make current visual selection active search text.
xnoremap * :<C-u>call kutsan#mappings#visualsetsearch('/')<Enter>/<C-r>=@/<Enter><Enter>
xnoremap # :<C-u>call kutsan#mappings#visualsetsearch('?')<Enter>?<C-r>=@/<Enter><Enter>
