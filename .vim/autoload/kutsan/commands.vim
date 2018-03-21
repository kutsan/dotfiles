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

""
" Start profiling until it's invoked with ! modifier once again.
"
" command! -bang Profile call kutsan#commands#profile(<bang>0)
"
" @param {boolean} bang Stop profiling and quit without triggering events.
""
function! kutsan#commands#profile(bang)
	if !a:bang
		profile start ~/.vim/cache/log/profile.log
		profile func *
		profile file *
	else
		profile pause
		noautocmd qall
	endif
endfunction
