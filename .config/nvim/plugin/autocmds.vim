" Save the current buffer after changes.
augroup savebuffer
  autocmd!
  autocmd InsertLeave,TextChanged * call user#autocmds#savebuffer#()
augroup end

" Jump to last known position and center buffer around cursor.
augroup jumplast
  autocmd!
  autocmd BufWinEnter ?* call user#autocmds#jumplast#()
augroup end

" Remove trailing whitespace characters.
augroup trimtrailing
  autocmd!
  autocmd BufWritePre * call user#autocmds#trimtrailing#()
augroup end
