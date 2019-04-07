" Fix 'commentstring'.
setlocal commentstring=#\ %s

" Undo filetype specific settings upon changing filetype.
let b:undo_ftplugin = 'setlocal commentstring<'
