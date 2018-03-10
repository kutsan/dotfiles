""
" Debug function for development.
""
function! kutsan#debug#log(string) abort
	call writefile([a:string], expand('$HOME') . '/.vim/cache/log/debug.log', 'aS')
endfunction
