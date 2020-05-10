" Quickly close current window.
nnoremap <silent> <Leader>q :quit<CR>

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

" Always send contents of a `x` command to the black hole register.
nnoremap x "_x

" Refactor word under cursor.
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" Delete word under cursor.
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN

" Correct bad indent while pasting.
nnoremap gp p=`]
nnoremap gP P=`]

" Scroll viewport faster.
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Reveal syntax group under cursor.
nnoremap <F2> :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>

" Construct grep search.
nnoremap gs :Search ''<Left>
nnoremap gS :Search! ''<Left>

" Resize current window sizes.
nnoremap <S-Up> 2<C-w>+
nnoremap <S-Down> 2<C-w>-
nnoremap <S-Right> 2<C-w>>
nnoremap <S-Left> 2<C-w><

" [y]ank [p]ath [f]ull.
nnoremap <silent> ypf :let @+ = expand('%:p')<CR>
" [y]ank [p]ath [r]elative.
nnoremap <silent> ypr :let @+ = expand('%')<CR>
" [y]ank [p]ath [n]ame.
nnoremap <silent> ypn :let @+ = expand('%:t')<CR>

" Toggle terminal buffer.
tnoremap <silent> <C-z> <C-\><C-n>:call kutsan#mappings#normal#terminal#()<CR>
nnoremap <silent> <C-z> :call kutsan#mappings#normal#terminal#()<CR>

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Add [count] blank lines above or below the cursor.
nnoremap <silent> [<Space> :<C-u>put! =repeat(nr2char(10), v:count1) <Bar> ']+1<CR>
nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10), v:count1) <Bar> '[-1<CR>

" Open URL under cursor in browser or open path in GUI explorer.
nnoremap <silent> gb :execute printf('silent !xdg-open "%s" 2>/dev/null', expand('<cfile>'))<CR>

" Toggle common options.
nnoremap <silent> cos :set spell!<CR>
nnoremap <silent> cow :set wrap!<CR>
nnoremap <silent> coh :set hlsearch!<CR>

" Jump to a tag directly when there is only one match.
nnoremap <C-]> g<C-]>zt

" Go previous and next buffers.
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

" Go previous and next location list entry.
nnoremap <silent> [l :labove<CR>
nnoremap <silent> ]l :lbelow<CR>

" QuickFix navigation mappings.
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

" Format whole file using `gq` wrapper and `[a]n [e]ntire` operator.
nmap <silent> \f gqae
