" Save the current buffer after changes.
augroup savebuffer
  autocmd!
  autocmd InsertLeave,TextChanged * call kutsan#autocmds#savebuffer#()
augroup end

" Jump to last known position and center buffer around cursor.
augroup jumplast
  autocmd!
  autocmd BufWinEnter ?* call kutsan#autocmds#jumplast#()
augroup end

" Remove trailing whitespace characters.
augroup trimtrailing
  autocmd!
  autocmd BufWritePre * call kutsan#autocmds#trimtrailing#()
augroup end
