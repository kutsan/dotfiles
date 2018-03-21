scriptencoding UTF-8

" Ensure the cursor is its box form in vanilla Vim.
augroup ensurecursorbox
	autocmd!
	if !has('nvim') && !has('gui')
		autocmd VimEnter * silent execute "!printf '[0 q'" | redraw!
	endif
augroup end

" Toggle relative numbers in Insert/Normal mode.
augroup togglerelativelinenumbers
	autocmd!
	autocmd InsertEnter * set norelativenumber
	autocmd InsertLeave * set relativenumber
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
