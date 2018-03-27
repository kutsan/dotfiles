" Stay in visual mode when indenting.
xnoremap < <gv
xnoremap > >gv

" Bubble the lines to up or down.
xnoremap J :move '>+1<Enter>gv=gv
xnoremap K :move '<-2<Enter>gv=gv

" Alternative end and beginning of line shortcuts.
xnoremap H ^
xnoremap L g_

" Always search with 'very magic' mode.
xnoremap / /\v
xnoremap ? ?\v

" Execute macro 'q' over visual line selections.
xnoremap Q :'<,'>:normal! @q<Enter>

" Make current visual selection active search text.
xnoremap * :<C-u>call kutsan#mappings#visualsetsearch('/')<Enter>/<C-r>=@/<Enter><Enter>
xnoremap # :<C-u>call kutsan#mappings#visualsetsearch('?')<Enter>?<C-r>=@/<Enter><Enter>
