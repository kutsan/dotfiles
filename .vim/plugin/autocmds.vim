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
	autocmd InsertEnter * set norelativenumber " Disable relative line numbers in Insert mode.
	autocmd InsertLeave * set relativenumber " Enable relative line numbers in Normal mode.
augroup end

" Automatically remove trailing whitespace characters.
augroup striptrailing
	autocmd!
	autocmd BufWritePre <buffer> :1,$substitute/\v\C\s\+$//e
augroup end

" Remember cursor position and center buffer around cursor.
augroup remembercursorposition
	autocmd!
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\	execute "normal! g`\"" |
		\ endif
	autocmd BufRead * normal! zz
augroup end

" Automatically save the current buffer.
augroup savebuffer
	autocmd!
	autocmd InsertLeave,TextChanged * nested silent! update
augroup end

" Automatically set current working directory project root.
augroup setprojectroot
	autocmd!
	autocmd VimEnter,BufEnter * :call kutsan#autocmds#setprojectroot()
augroup end

" Start insert mode and disable line numbers on terminal buffer.
augroup terminalsettings
	autocmd!
	if has('nvim')
		autocmd TermOpen * setlocal nonumber norelativenumber " Disable line numbers.
		autocmd TermOpen * startinsert " Automatically activate insert mode.
	endif
augroup end
