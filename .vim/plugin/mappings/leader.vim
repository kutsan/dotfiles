" Shortcuts for quiting.
nnoremap <silent> <Leader>q :quit<Enter>
nnoremap <silent> <Leader>Q :quitall<Enter>

" Insert an empty new line without entering insert mode.
nnoremap <Leader>o :put =repeat(nr2char(10), v:count1)<Enter>
nnoremap <Leader>O :put! =repeat(nr2char(10), v:count1)<Enter>
