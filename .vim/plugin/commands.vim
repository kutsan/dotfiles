" Run any command under toggle terminal.
command! -nargs=* -complete=shellcmd T call kutsan#mappings#toggleterminal(<q-args>)

" Open documentations for given query.
command! -nargs=* Docs call kutsan#commands#docs(<q-args>)
