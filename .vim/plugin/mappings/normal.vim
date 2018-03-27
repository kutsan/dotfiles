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

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Forward and backward jump.
nnoremap J 5j
nnoremap K 5k

" Avoid collision between <Tab> and <C-i> with mapping <C-i> to <F6> system-wide.
nnoremap <F6> <C-i>

" Visual select a single line in character-wise without newline character.
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

" Use `s` for registers.
nnoremap s "

" Add [count] blank lines above or below the cursor.
nnoremap [<Space> :<C-u>put! =repeat(nr2char(10), v:count1) <Bar> ']+1<Enter>
nnoremap ]<Space> :<C-u>put =repeat(nr2char(10), v:count1) <Bar> '[-1<Enter>

" Toggle common options.
nnoremap <silent> cos :set spell!<Enter>
nnoremap <silent> cow :set wrap!<Enter>
nnoremap <silent> coh :set hlsearch!<Enter>
nnoremap <silent> coH :let @/ = ''<Enter>
nnoremap <silent> col :set list!<Enter>
nnoremap <silent> cop :set paste!<Enter>

" Improve tag jump mappings.
nnoremap <C-]> g<C-]>
nnoremap <silent> g[ :pop<Enter>

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

" Navigate over [t]abs.
nnoremap <silent> [t :tabprevious<Enter>
nnoremap <silent> ]t :tabnext<Enter>

" Shortcuts for quiting.
nnoremap <silent> <Leader>q :quit<Enter>
nnoremap <silent> <Leader>Q :quitall<Enter>

" Lookup definition under cursor.
nnoremap <Leader>K K

" Join lines with a minimum of two lines.
nnoremap <Leader>J J

" Toggle zoom current buffer in the new tab.
nnoremap <silent> <Leader>z :call kutsan#mappings#togglezoom()<Enter>
