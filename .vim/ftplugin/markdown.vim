" Enable spell checking.
setlocal spell

" Wrap lines longer than the width of the window.
setlocal wrap

" Disable all line numbers.
setlocal nonumber
setlocal norelativenumber

" Navigate screen lines instead of actual lines.
nnoremap <buffer> $ g$
onoremap <buffer> $ g$
vnoremap <buffer> $ g$
nnoremap <buffer> 0 g0
onoremap <buffer> 0 g0
vnoremap <buffer> 0 g0
nnoremap <buffer> ^ g^
onoremap <buffer> ^ g^
vnoremap <buffer> ^ g^

" Toggle local preview server.
nnoremap <buffer><silent> <LocalLeader>r :call kutsan#ftplugin#markdown#preview()<Enter>
