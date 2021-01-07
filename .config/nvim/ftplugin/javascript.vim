" List of file extensions which are used with `gf` like commands.
setlocal suffixesadd=.js,.jsx

" Set include pattern for only ECMAScript modules.
let &l:include = '\<from\>\s["'']\zs[^"'']\+\ze["'']'

" Define 'formatprg'.
let &l:formatprg = printf(
	\ '%s --parser "babel"',
	\ !empty(glob('node_modules/prettier/bin-prettier.js'))
		\ ? 'node_modules/prettier/bin-prettier.js'
		\ : 'prettier'
\ )

" Always use wrapper 'includeexpr', not just as fallback.
nnoremap <buffer><silent> gf :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'))<CR>
nnoremap <buffer><silent> <C-w>f :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'), { 'command': 'split' })<CR>
nnoremap <buffer><silent> <C-w><C-f> :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'), { 'command': 'split' })<CR>
nnoremap <buffer><silent> <C-w>gf :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'), { 'command': 'tab split' })<CR>

" Execute current file.
nnoremap <buffer><silent> <LocalLeader>r :execute 'vsplit <Bar> terminal node' shellescape(@%, 1)<CR>
