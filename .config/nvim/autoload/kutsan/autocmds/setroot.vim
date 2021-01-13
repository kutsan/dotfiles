""
" Set the current working directory to the directory that is provided with
" argument list or to the git root.
"
" autocmd VimEnter * call kutsan#autocmds#setroot#()
""
function! kutsan#autocmds#setroot#() abort
  let l:amatch = expand('<amatch>')

  if isdirectory(l:amatch)
    execute printf('cd %s', fnameescape(l:amatch))
    return v:true
  endif

  let l:currentdir = escape(expand('%:p:h'), ' ')

  if !isdirectory(l:currentdir)
    return v:false
  endif

  let l:gitdir = finddir('.git', l:currentdir .. ';')
  let l:rootdir = fnameescape(fnamemodify(l:gitdir, ':h'))

  execute 'cd' l:rootdir
endfunction
