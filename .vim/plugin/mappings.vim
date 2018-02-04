" -- Insert Mode
" ------------------------------------------------

" -- Normal Mode
" ------------------------------------------------

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
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

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

" Go back or launch the terminal buffer.
nnoremap <silent> <C-z> :call kutsan#mappings#toggleterminal()<Enter>

" Shortcuts for quiting.
nnoremap <silent> <Leader>q :quit<Enter>
nnoremap <silent> <Leader>Q :quitall<Enter>

" Quickly refactor variables.
nnoremap <Leader>* *``cgn
nnoremap <Leader># #``cgN

" Toggle spell checking.
nnoremap <silent> <Leader>s :set spell!<Enter>

" Lookup definition under cursor.
nnoremap <Leader>K K

" Join lines with a minimum of two lines.
nnoremap <Leader>J J

" Correct bad indent while pasting.
nnoremap <Leader>p p=`]
nnoremap <Leader>P P=`]

" Toggle search highlighting.
nnoremap <Leader>? :set hlsearch!<Enter>

" Open `vimrc` file in new buffer.
nnoremap <Leader>ee :edit $MYVIMRC<Enter>

" Reload `vimrc` file.
nnoremap <Leader>er :source $MYVIMRC<Enter>

" -- Command Mode
" ------------------------------------------------

" Write with sudo.
cnoremap w!! w !sudo tee % >/dev/null

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

" -- Visual Mode
" ------------------------------------------------

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
xnoremap L $

" Always search with 'very magic' mode.
xnoremap / /\v
xnoremap ? ?\v

" -- Operator Mode
" ------------------------------------------------

" [a]n [e]ntire buffer.
onoremap ae :<C-u>normal! VGogg<Enter>

" Last selected area.
onoremap gv :<C-u>normal! gv<Enter>

" End and beginning of line.
onoremap H ^
onoremap L $

" -- Terminal Mode
" ------------------------------------------------

" Escape from terminal mode and go back previous buffer.
tnoremap <C-z> <C-\><C-n><C-^>
