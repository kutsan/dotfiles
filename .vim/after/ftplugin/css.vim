" Undo filetype specific settings upon changing filetype.
let s:undo =
	\      'setlocal formatprg<'
	\ . " | execute 'nunmap <buffer> <LocalLeader>f'"

if exists('b:undo_ftplugin')
	let b:undo_ftplugin .= ' | ' . s:undo
else
	let b:undo_ftplugin = s:undo
endif

unlet s:undo
