" Disable all line numbers.
setlocal nonumber
setlocal norelativenumber

" Disable conceal feature of markdown ftplugin.
let g:vim_markdown_conceal = v:false
let g:vim_markdown_conceal_code_blocks = v:false

" Toggle local preview server.
nnoremap <buffer><silent> <LocalLeader>r :call kutsan#ftplugin#markdown#preview()<CR>
