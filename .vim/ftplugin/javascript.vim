" Set current compiler.
compiler npm

" List of file extensions which are used with `gf` like commands.
setlocal suffixesadd=.js,.jsx

" Lookup documentations in browser.
setlocal keywordprg=:Docs

" Set include pattern for only ECMAScript modules.
let &l:include = '\<from\>\s["'']\zs[^"'']\+\ze["'']'

" Always use wrapper 'includeexpr', not just as fallback.
nnoremap <buffer><silent> gf :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'))<Enter>
nnoremap <buffer><silent> <C-w>f :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'), { 'command': 'split' })<Enter>
nnoremap <buffer><silent> <C-w><C-f> :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'), { 'command': 'split' })<Enter>
nnoremap <buffer><silent> <C-w>gf :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'), { 'command': 'tab split' })<Enter>

" Execute current file.
nnoremap <buffer><silent> <LocalLeader>r :execute 'split <Bar> terminal node' shellescape(@%, 1)<Enter>
