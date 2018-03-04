""
" Set current working directory to git root.
""
function! kutsan#autocmds#setprojectroot()
	let l:root = substitute(system('git rev-parse --show-toplevel'), '\n\+$', '', '')

	if isdirectory(l:root) && l:root !=# $HOME
		execute 'cd' l:root
	endif
endfunction

" Trim trailing whitespace characters from end of each line.
function! kutsan#autocmds#trimtrailingspaces()
	if &l:modifiable
		let l:view = winsaveview()

		try
			silent! 1,$substitute/\s\+$//e
		finally
			call winrestview(l:view)
		endtry
	endif
endfunction

" Launch table of contents to the left as vertical pane for manual pages.
function! kutsan#autocmds#showtoc()
	if !has('nvim')
		return v:false
	endif

	call man#show_toc()

	setlocal nonumber norelativenumber
	setlocal laststatus=0

	nnoremap <buffer> l <Enter>zt

	wincmd H
	vert resize 35
	wincmd p
endfunction
