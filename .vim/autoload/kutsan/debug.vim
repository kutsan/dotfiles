""
" Debug function for development.
"
" @param {string} Content to be written to file.
""
function! kutsan#debug#log(content) abort
	call writefile([a:content], expand('$HOME') . '/.vim/cache/log/debug.log', 'aS')
endfunction
