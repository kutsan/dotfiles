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
		autocmd TextYankPost * lua vim.highlight.on_yank({higroup="Visual", timeout=100})
	endif
augroup end

" Save the current buffer after any changes.
augroup savebuffer
	autocmd!
	autocmd InsertLeave,TextChanged * call kutsan#autocmds#savebuffer#()
augroup end

" Set current working directory.
augroup setroot
	autocmd!
	autocmd VimEnter * call kutsan#autocmds#setroot#()
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

" Block changes to read-only buffers.
augroup blockreadonly
	autocmd!
	autocmd BufReadPost * let &l:modifiable = !&readonly
augroup end
