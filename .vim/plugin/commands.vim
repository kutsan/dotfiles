" Run any command under toggle terminal.
command! -nargs=* -complete=shellcmd T call kutsan#mappings#toggleterminal(<q-args>)
