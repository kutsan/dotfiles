" Run any command under toggle terminal.
command! -nargs=* -complete=shellcmd T call kutsan#terminal#execute(<q-args>)

" Open documentations for given query.
command! -nargs=* Docs call kutsan#commands#docs(<q-args>)

" Start profiling until it's invoked with ! modifier once again.
command! -bang Profile call kutsan#commands#profile(<bang>v:false)
