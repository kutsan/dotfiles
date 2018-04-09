" Asynchronously Git client.
Plug 'lambdalisue/gina.vim'

" Length of the commit hash.
let g:gina#component#repo#commit_length = 7

" Define mappings.
nnoremap gig :silent Gina qrep --perl-regexp ''<Left>
nnoremap <silent> gib :Gina blame<Enter>
nnoremap <silent> gid :execute 'Gina diff' expand('%:p')<Enter>
nnoremap <silent> gil :Gina log<Enter>
nnoremap <silent> gis :Gina status -s<Enter>
