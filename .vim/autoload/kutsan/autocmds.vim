""
" Set current working directory to git root.
"
" autocmd VimEnter,BufEnter * call kutsan#autocmds#setprojectroot()
""
function! kutsan#autocmds#setprojectroot() abort
	let l:root = systemlist('git rev-parse --show-toplevel')[0]

	if !v:shell_error && l:root !=# $HOME
		execute 'cd' l:root
	endif
endfunction

""
" Jump to last known position and center buffer around cursor.
"
" autocmd BufReadPost *? call kutsan#autocmds#jumplastknownposition()
""
function! kutsan#autocmds#jumplastknownposition() abort
	if empty(&buftype) && index(['diff', 'gitcommit'], &filetype) == -1
		if line("'\"") > 0 && line("'\"") <= line('$')
			execute 'normal! g`"zz'
		endif
	endif
endfunction

""
" Trim trailing whitespace characters from end of each line.
"
" autocmd BufWritePre * call kutsan#autocmds#trimtrailingspaces()
""
function! kutsan#autocmds#trimtrailingspaces() abort
	if &l:modifiable && !&l:binary
		let l:view = winsaveview()

		try
			silent! 1,$substitute/\s\+$//e
		finally
			call winrestview(l:view)
		endtry
	endif
endfunction

""
" Open file explorer if argument list contains at least one directory.
"
" autocmd VimEnter * call kutsan#autocmds#openfileexplorer()
""
function! kutsan#autocmds#openfileexplorer() abort
	let l:directory = expand('<amatch>')

	if isdirectory(l:directory)
		execute printf('cd %s', fnameescape(l:directory))

		if exists(':NERDTree')
			NERDTree
			only
		endif
	endif
endfunction

""
" Create directory path if it's not exist.
"
" autocmd BufWritePre * call kutsan#autocmds#makemissingdirectory(expand('<afile>:p:h'))
"
" @param {string} directory Path of the missing directory to be created.
" @param {boolean} force Create missing directory without prompting anything.
""
function! kutsan#autocmds#makemissingdirectory(directory, force) abort
	if empty(a:directory) || a:directory =~# '\v\c^\w+://' || isdirectory(a:directory)
		return v:false
	endif

	if !a:force
		echohl Question
		call inputsave()

		try
			let l:answer = input(
				\ printf(
					\ '"%s" does not exist. Create? (y/N): ',
					\ a:directory
				\ ),
				\ ''
			\ )

			if empty(l:answer)
				return v:false
			endif
		finally
			call inputrestore()
			echohl None
		endtry
	endif

	return mkdir(a:directory, 'p')
endfunction

""
" Launch table of contents to the left as vertical pane for manual pages.
"
" autocmd FileType man call kutsan#autocmds#showtoc()
""
function! kutsan#autocmds#showtoc() abort
	if !has('nvim')
		return v:false
	endif

	call man#show_toc()

	setlocal nonumber norelativenumber
	setlocal laststatus=0

	nnoremap <buffer> l <Enter>zt
	nnoremap <buffer> q :quitall<Enter>

	wincmd H
	vert resize 35
	wincmd p
endfunction
