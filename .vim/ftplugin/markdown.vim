" Disable all line numbers.
setlocal nonumber
setlocal norelativenumber

" Toggle local preview server.
nnoremap <buffer><silent> <LocalLeader>r :call kutsan#ftplugin#markdown#preview()<CR>
