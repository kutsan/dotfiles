" Define 'formatprg'.
let &l:formatprg = printf(
  \ '%s --parser "markdown"',
  \ !empty(glob('node_modules/.bin/prettier'))
    \ ? 'node_modules/.bin/prettier'
    \ : 'prettier'
\ )

" Undo filetype specific settings upon changing filetype.
let s:undo =
  \      'setlocal number< relativenumber< formatprg<'
  \ .. " | execute 'nunmap <buffer> <LocalLeader>r'"

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | ' .. s:undo
else
  let b:undo_ftplugin = s:undo
endif

unlet s:undo
