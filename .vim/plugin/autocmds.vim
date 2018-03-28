" Toggle relative numbers in Insert/Normal mode.
augroup togglerelativelinenumbers
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

" Automatically remove trailing whitespace characters.
augroup trimtrailingspaces
	autocmd!
	autocmd BufWritePre * call kutsan#autocmds#trimtrailingspaces()
augroup end

" Jump to last known position and center buffer around cursor.
augroup jumplastknownposition
	autocmd!
	autocmd BufWinEnter ?* call kutsan#autocmds#jumplastknownposition()
augroup end

" Automatically save the current buffer.
augroup autosavebuffer
	autocmd!
	autocmd InsertLeave,TextChanged * nested
		\ if empty(&buftype) && !empty(bufname('')) |
			\ silent! update |
		\ endif
	autocmd CursorHold * silent! checktime
augroup end

" Automatically set current working directory project root.
augroup setprojectroot
	autocmd!
	autocmd VimEnter,BufEnter * call kutsan#autocmds#setprojectroot()
augroup end

" Local command-line window settings.
augroup commandlinewindowsettings
	autocmd!
	autocmd CmdwinEnter *
		\ setlocal signcolumn=no nonumber norelativenumber |
		\ startinsert
augroup end

" Start insert mode and disable line numbers on terminal buffer.
augroup terminalsettings
	autocmd!
	if has('nvim')
		autocmd TermOpen *
			\ setlocal nonumber norelativenumber |
			\ startinsert
	endif
augroup end

" Launch table of contents to the left as vertical pane for manual pages.
augroup manshowtoc
	autocmd!
	if has('nvim')
		autocmd FileType man call kutsan#autocmds#showtoc()
	endif
augroup end
