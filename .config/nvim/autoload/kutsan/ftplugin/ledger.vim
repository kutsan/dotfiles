""
" Add new ledger entry.
"
" nnoremap <buffer><silent> <LocalLeader>a :call kutsan#ftplugin#ledger#add()<CR>
""
function! kutsan#ftplugin#ledger#add() abort
	normal! G
	put =nr2char(10)

	let l:template = printf(
		\ "%s \n
		\  account  value currency\n
		\  account",
		\ strftime('%Y-%m-%d')
	\ )

	put =l:template
	normal! 2k
	startinsert!
endfunction
