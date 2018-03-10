" List of file extensions which are used with `gf` like commands.
setlocal suffixesadd=.js,.jsx

" Set include pattern for only ECMAScript modules.
let &l:include = '\<from\>\s["'']\zs[^"'']\+\ze["'']'

" Always use wrapper 'includeexpr', not just as fallback.
nnoremap <buffer><silent> gf :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'), bufname('%'))<Enter>
nnoremap <buffer><silent> <C-w>f :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'), bufname('%'), 'split')<Enter>
nnoremap <buffer><silent> <C-w><C-f> :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'), bufname('%'), 'split')<Enter>
nnoremap <buffer><silent> <C-w>gf :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'), bufname('%'), 'tab split')<Enter>
