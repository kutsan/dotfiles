" List of file extensions which are used with `gf` like commands.
setlocal suffixesadd=.js,.jsx

" Define 'formatprg'.
if !empty(glob('node_modules/prettier/bin-prettier.js'))
	let &l:formatprg = 'node_modules/prettier/bin-prettier.js --parser "babel" 2>/dev/null'
endif

" Set include pattern for only ECMAScript modules.
let &l:include = '\<from\>\s["'']\zs[^"'']\+\ze["'']'

" Always use wrapper 'includeexpr', not just as fallback.
nnoremap <buffer><silent> gf :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'))<Enter>
nnoremap <buffer><silent> <C-w>f :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'), { 'command': 'split' })<Enter>
nnoremap <buffer><silent> <C-w><C-f> :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'), { 'command': 'split' })<Enter>
nnoremap <buffer><silent> <C-w>gf :call kutsan#ftplugin#javascript#gotofile(expand('<cfile>'), { 'command': 'tab split' })<Enter>

" Execute current file.
nnoremap <buffer><silent> <LocalLeader>r :execute 'split <Bar> terminal node' shellescape(@%, 1)<Enter>

" Format whole file using `gq` wrapper and `[a]n [e]ntire` operator.
nmap <buffer><silent> <LocalLeader>f gqae

" Insert `console.log()`.
func s:eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc
inoreabbrev <silent> log console.log()<Left><C-r>=<SID>eatchar('\s')<Enter>
