" Execute current file.
nnoremap <buffer><silent> <LocalLeader>r :execute "split <Bar> terminal $SHELL" shellescape(@%, 1)<CR>
