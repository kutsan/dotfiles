" Undo filetype specific settings upon changing filetype.
let s:undo =
	\      'setlocal suffixesadd< include< formatprg<'
	\ .. " | execute 'nunmap <buffer> gf'"
	\ .. " | execute 'nunmap <buffer> <C-w>f'"
	\ .. " | execute 'nunmap <buffer> <C-w><C-f>'"
	\ .. " | execute 'nunmap <buffer> <C-w>gf'"
	\ .. " | execute 'nunmap <buffer> <LocalLeader>r'"

if exists('b:undo_ftplugin')
	let b:undo_ftplugin .= ' | ' .. s:undo
else
	let b:undo_ftplugin = s:undo
endif

unlet s:undo
