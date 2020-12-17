" Undo filetype specific settings upon changing filetype.
let s:undo = "execute 'nunmap <buffer> <LocalLeader>r'"

if exists('b:undo_ftplugin')
	let b:undo_ftplugin .= ' | ' .. s:undo
else
	let b:undo_ftplugin = s:undo
endif

unlet s:undo
