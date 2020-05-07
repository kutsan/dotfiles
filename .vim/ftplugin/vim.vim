" Define the command to be used when looking definition.
setlocal keywordprg=:help

" Source current file.
nnoremap <buffer><silent> <LocalLeader>r :source %<CR>
