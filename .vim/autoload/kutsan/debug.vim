""
" Debug function for development.
"
" @param {string} content Content to be written to file.
""
function! kutsan#debug#log(content) abort
	let l:contentwithdate = printf(
		\ '[%s] %s',
		\ strftime('%Y-%m-%d %H:%M:%S'),
		\ a:content
	\ )

	call writefile([l:contentwithdate], $HOME .. '/.vim/cache/log/debug.log', 'aS')
endfunction
