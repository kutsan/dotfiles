""
" Open documentations in browser for given query.
"
" @param {string} query Search query for documentation.
""
function! kutsan#commands#docs(query) abort
	call system(
		\ printf(
			\ '%s "https://devdocs.io/?q=%s"',
			\ executable('reopen') ? 'reopen' : 'xdg-open',
			\ a:query
		\ )
	\ )
endfunction
