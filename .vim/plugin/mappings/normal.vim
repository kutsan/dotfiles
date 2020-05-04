" Quickly close current window.
nnoremap <silent> <Leader>q :quit<Enter>

" Pane nagivation.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Always search with 'very magic' mode.
nnoremap / /\v
nnoremap ? ?\v

" Override Ex mode with run @q.
nnoremap Q @q

" Go back to the last buffer shortcut.
nnoremap <C-b> <C-^>

" Always send contents of a `x` command to the black hole register.
nnoremap x "_x

" Refactor word under cursor.
nnoremap c* /\<<C-R>=expand('<cword>')<Enter>\>\C<Enter>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<Enter>\>\C<Enter>``cgN

" Delete word under cursor.
nnoremap d* /\<<C-r>=expand('<cword>')<Enter>\>\C<Enter>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<Enter>\>\C<Enter>``dgN

" Correct bad indent while pasting.
nnoremap gp p=`]
nnoremap gP P=`]

" Correct spelling mistakes under the cursor.
nnoremap z= 1z=

" Scroll viewport faster.
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Select last changed or yanked area.
nnoremap <expr> gV '`[' . strpart(getregtype(), 0, 1) . '`]'

" Reveal syntax group under cursor.
nnoremap <F2> :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<Enter>

" Construct grep search.
nnoremap gs :Search ''<Left>
nnoremap gS :Search! ''<Left>

" Resize current window sizes.
nnoremap <S-Up> 2<C-w>+
nnoremap <S-Down> 2<C-w>-
nnoremap <S-Right> 2<C-w>>
nnoremap <S-Left> 2<C-w><

" [y]ank [p]ath [f]ull.
nnoremap <silent> ypf :let @+ = expand('%:p')<Enter>
" [y]ank [p]ath [r]elative.
nnoremap <silent> ypr :let @+ = expand('%')<Enter>
" [y]ank [p]ath [n]ame.
nnoremap <silent> ypn :let @+ = expand('%:t')<Enter>

" Toggle terminal buffer.
tnoremap <silent> <C-z> <C-\><C-n>:call kutsan#mappings#normal#terminal#()<Enter>
nnoremap <silent> <C-z> :call kutsan#mappings#normal#terminal#()<Enter>

" Open URL under cursor in browser or open path in GUI explorer.
nnoremap <silent> gb :execute printf('silent !xdg-open "%s" 2>/dev/null', expand('<cfile>'))<Enter>

" Toggle common options.
nnoremap <silent> cos :set spell!<Enter>
nnoremap <silent> cow :set wrap!<Enter>
nnoremap <silent> coh :set hlsearch!<Enter>

" Jump to a tag directly when there is only one match.
nnoremap <C-]> g<C-]>zt

" Go previous and next buffers.
nnoremap <silent> [b :bprevious<Enter>
nnoremap <silent> ]b :bnext<Enter>

" Go previous and next location list entry.
nnoremap <silent> [l :labove<Enter>
nnoremap <silent> ]l :lbelow<Enter>

" QuickFix navigation mappings.
nnoremap <silent> <Up> :cprevious<Enter>
nnoremap <silent> <Down> :cnext<Enter>
nnoremap <silent> <Left> :cpfile<Enter>
nnoremap <silent> <Right> :cnfile<Enter>
