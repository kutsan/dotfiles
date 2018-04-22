" Install non-existing plugins.
augroup pluginstall
	autocmd VimEnter *
		\ if exists('g:loaded_plug') && len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) |
			\ PlugInstall --sync |
			\ quitall |
		\ endif
augroup end

" Toggle relative numbers in Insert/Normal mode.
augroup togglerelative
	autocmd!
	autocmd InsertEnter,BufLeave,WinLeave,FocusLost *
		\ if &l:number && empty(&buftype) |
			\ setlocal norelativenumber |
		\ endif
	autocmd InsertLeave,BufEnter,WinEnter,FocusGained *
		\ if &l:number && empty(&buftype) |
			\ setlocal relativenumber |
		\ endif
augroup end

" Local command-line window settings.
augroup commandlinewindow
	autocmd!
	autocmd CmdwinEnter *
		\ setlocal signcolumn=no nonumber norelativenumber |
		\ startinsert
augroup end

" Save the current buffer after any changes.
augroup savebuffer
	autocmd!
	autocmd InsertLeave,TextChanged * nested
		\ if empty(&buftype) && !empty(bufname('')) |
			\ silent! update |
		\ endif
	autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end

" Start insert mode and disable line numbers in terminal buffer.
augroup terminalsettings
	autocmd!
	if has('nvim')
		autocmd TermOpen * setlocal nonumber norelativenumber
		autocmd TermOpen * startinsert
	endif
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

" Launch table of contents to the left as vertical pane for manual pages.
augroup manshowtoc
	autocmd!
	if has('nvim')
		autocmd FileType man call kutsan#autocmds#manshowtoc#()
	endif
augroup end
