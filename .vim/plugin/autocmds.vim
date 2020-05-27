" Start insert mode and disable line numbers in terminal buffer.
augroup terminalsettings
	autocmd!
	if has('nvim')
		autocmd TermOpen * setlocal nonumber norelativenumber
		autocmd TermOpen * startinsert
	endif
augroup end

" Briefly highlight yanked region.
augroup highlightyank
	autocmd!

	if has('nvim')
		autocmd TextYankPost * lua require'vim.highlight'.on_yank('Visual', 100)
	endif
augroup end

" Save the current buffer after any changes.
augroup savebuffer
	autocmd!
	autocmd InsertLeave,TextChanged * call kutsan#autocmds#savebuffer#()
augroup end

" Set current working directory project root.
augroup setroot
	autocmd!
	autocmd VimEnter,BufEnter * call kutsan#autocmds#setroot#()
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

" Open file explorer if argument list contains at least one directory.
augroup openexplorer
	autocmd!
	autocmd VimEnter * call kutsan#autocmds#openexplorer#()
augroup end

" Create directory path if it's not exist.
augroup makemissing
	autocmd!
	autocmd BufWritePre * call kutsan#autocmds#makemissing#(expand('<afile>:p:h'), v:cmdbang)
augroup end
