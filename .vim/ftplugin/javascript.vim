" List of file extensions which are used with `gf` like commands.
setlocal suffixesadd=.js,.jsx

" Set include pattern for only ECMAScript modules.
let &l:include = '\<from\>\s["'']\zs[^"'']\+\ze["'']'

" Define 'formatprg'.
if !empty(glob('node_modules/prettier/bin-prettier.js'))
	let &l:formatprg = 'node_modules/prettier/bin-prettier.js --parser "babel" 2>/dev/null'
endif

" Always use wrapper 'includeexpr', not just as fallback.
nnoremap <buffer><silent> gf :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'))<CR>
nnoremap <buffer><silent> <C-w>f :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'), { 'command': 'split' })<CR>
nnoremap <buffer><silent> <C-w><C-f> :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'), { 'command': 'split' })<CR>
nnoremap <buffer><silent> <C-w>gf :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'), { 'command': 'tab split' })<CR>

" Execute current file.
nnoremap <buffer><silent> <LocalLeader>r :execute 'split <Bar> terminal node' shellescape(@%, 1)<CR>

" Insert `console.log()`.
function! s:eatchar(pat) abort
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunction
inoreabbrev <silent> log console.log()<Left><C-r>=<SID>eatchar('\s')<CR>
