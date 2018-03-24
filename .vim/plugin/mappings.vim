" -- Normal Mode ---------------------------------

" Pane nagivation.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Toggle fold at current position.
nnoremap <Tab> za

" Always search with 'very magic' mode.
nnoremap / /\v
nnoremap ? ?\v

" Clear search register and thus highlighting.
nnoremap <silent> <BS> :let @/ = ''<Enter>

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Forward and backward jump.
nnoremap J 5j
nnoremap K 5k

" Avoid collision between <Tab> and <C-i> with mapping <C-i> to <F6> system-wide.
nnoremap <F6> <C-i>

" Visual select a single line in character-wise without new-line character.
nnoremap vv _vg_

" Override Ex mode with run @q.
nnoremap Q @q

" Go back to last buffer shortcut.
nnoremap <C-b> <C-^>

" Alternative beginning and end of line shortcuts.
nnoremap H ^
nnoremap L $

" Send contents of a `x` command to the black hole register.
nnoremap x "_x

" Make `Y` acting like `C`, `D`.
nnoremap Y y$

" Quickly refactor variables.
nnoremap c* *``cgn
nnoremap c# #``cgN

" Toggle terminal buffer.
nnoremap <silent> <C-z> :call kutsan#mappings#toggleterminal()<Enter>

" Construct range operator.
nnoremap <silent> ! :<C-u>set operatorfunc=kutsan#mappings#exclamationoperator<Enter>g@

" Send given motion to appropriate REPL.
nnoremap <silent> gx :<C-u>let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#executeoperator<Enter>g@
nnoremap <silent> gxl :<C-u>let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#executeoperator <Bar> execute 'normal!' v:count 'g@_'<Enter>

" Add [count] blank lines above or below the cursor.
nnoremap <silent> [<Space> :<C-u>put! =repeat(nr2char(10), v:count1) <Bar> ']+1<Enter>
nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10), v:count1) <Bar> '[-1<Enter>

" Toggle common options.
nnoremap <silent> gos :set spell!<Enter>
nnoremap <silent> gow :set wrap!<Enter>
nnoremap <silent> goh :set hlsearch!<Enter>
nnoremap <silent> gol :set list!<Enter>

" Navigate over [l]ocation list.
nnoremap <silent> [l :lopen<Enter>
nnoremap <silent> [l :lprevious<Enter>
nnoremap <silent> ]l :lnext<Enter>
nnoremap <silent> [L :lfirst<Enter>
nnoremap <silent> ]L :llast<Enter>

" Navigate over [q]uickfix list.
nnoremap <silent> [q :cprevious<Enter>
nnoremap <silent> ]q :cnext<Enter>
nnoremap <silent> [Q :cfirst<Enter>
nnoremap <silent> ]Q :clast<Enter>

" Navigate over [b]uffer list.
nnoremap <silent> [b :bprevious<Enter>
nnoremap <silent> ]b :bnext<Enter>
nnoremap <silent> [B :bfirst<Enter>
nnoremap <silent> ]B :blast<Enter>

" Navigate over [a]rgument list.
nnoremap <silent> [a :previous<Enter>
nnoremap <silent> ]a :next<Enter>
nnoremap <silent> [A :first<Enter>
nnoremap <silent> ]A :last<Enter>

" Shortcuts for quiting.
nnoremap <silent> <Leader>q :quit<Enter>
nnoremap <silent> <Leader>Q :quitall<Enter>

" Lookup definition under cursor.
nnoremap <Leader>K K

" Join lines with a minimum of two lines.
nnoremap <Leader>J J

" Toggle zoom current buffer in the new tab.
nnoremap <silent> <Leader>z :call kutsan#mappings#togglezoom()<Enter>

" -- Terminal ------------------------------------

" Jump to the beginning and end of line.
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Jump previous and next commands from history.
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" Navigate left and right characters.
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Substitute with 'very magic' mode.
cnoremap <C-s>/ s/\v//gc<Left><Left><Left><Left>

" Move between matches without leaving incremental search.
cnoremap <expr> <Tab> getcmdtype() ==# '/' \|\| getcmdtype() ==# '?' ? '<Enter>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() ==# '/' \|\| getcmdtype() ==# '?' ? '<Enter>?<C-r>/' : '<S-Tab>'

" -- Visual --------------------------------------

" Stay in visual mode when indenting.
xnoremap < <gv
xnoremap > >gv

" Bubble the lines to up or down.
xnoremap J :move '>+1<Enter>gv=gv
xnoremap K :move '<-2<Enter>gv=gv

" Select [a]n [e]ntire buffer.
xnoremap ae GoggV

" Alternative end and beginning of line shortcuts.
xnoremap H ^
xnoremap L g_

" Always search with 'very magic' mode.
xnoremap / /\v
xnoremap ? ?\v

" Increment and decrement selected number(s).
xnoremap + g<C-a>gv
xnoremap - g<C-x>gv

" Execute macro 'q' over visual line selections.
xnoremap Q :'<,'>:normal! @q<CR>

" Make current visual selection active search text.
xnoremap * :<C-u>call kutsan#mappings#visualsetsearch('/')<Enter>/<C-r>=@/<Enter><Enter>
xnoremap # :<C-u>call kutsan#mappings#visualsetsearch('?')<Enter>?<C-r>=@/<Enter><Enter>

" Send current selection to appropriate REPL.
vnoremap <silent> gx :<C-u>call kutsan#mappings#executeoperator(visualmode(), 1)<Enter>

" -- Operator ------------------------------------

" [a]n [e]ntire buffer.
onoremap <silent> ae :<C-u>normal! VGogg<Enter>

" Last selected area.
onoremap gv :<C-u>normal! gv<Enter>

" End and beginning of line.
onoremap H ^
onoremap L $

" -- Terminal ------------------------------------

" Escape from terminal mode and toggle terminal buffer.
tnoremap <silent> <C-z> <C-\><C-n>:call kutsan#mappings#toggleterminal()<Enter>
