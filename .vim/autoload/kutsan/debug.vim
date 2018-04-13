""
" Debug function for development.
"
" @param {string} content Content to be written to file.
""
function! kutsan#debug#log(content) abort
	call writefile([a:content], $HOME . '/.vim/cache/log/debug.log', 'aS')
endfunction
