" Git client.
Plug 'tpope/vim-fugitive'

" Define mappings.
nnoremap <silent> gib :Gblame<Enter>
nnoremap <silent> gid :Gdiff<Enter>
nnoremap <silent> gil :Glog<Enter>
nnoremap <silent> gis :Gstatus<Enter>
nnoremap gig :silent Ggrep --perl-regexp ''<Left>
