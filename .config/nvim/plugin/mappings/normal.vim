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

" Go to the alternate buffer.
nnoremap <C-n> <C-^>

" Refactor word under cursor.
nnoremap c* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgN

" Scroll viewport faster.
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Construct grep search.
nnoremap gs :Grep ''<Left>
nnoremap gS :Grep! ''<Left>

" Resize current window sizes.
nnoremap <S-Up> 2<C-w>+
nnoremap <S-Down> 2<C-w>-
nnoremap <S-Right> 2<C-w>>
nnoremap <S-Left> 2<C-w><

" Toggle floating terminal or create new one if there is none.
tnoremap <silent> <C-z> <C-\><C-n>:lua require('kutsan/mappings/normal/terminal').toggle()<CR>
nnoremap <silent> <C-z> :lua require('kutsan/mappings/normal/terminal').toggle()<CR>

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

" Go previous and next location list entry.
nnoremap <silent> [l :labove<CR>
nnoremap <silent> ]l :lbelow<CR>

" QuickFix navigation mappings.
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

" Select last changed or yanked area.
nnoremap <expr> gV '`[' .. strpart(getregtype(), 0, 1) .. '`]'
