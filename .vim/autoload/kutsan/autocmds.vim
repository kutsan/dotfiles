function! kutsan#autocmds#setprojectroot()
	let l:root = substitute(system('git rev-parse --show-toplevel'), '\n\+$', '', '')

	if l:root ==# $HOME
		let l:root = substitute($PWD, $HOME . '\v/.{-}\zs/.*\ze', '', '')
	endif

	if l:root ==# $PWD
		let l:root = substitute(expand('%:p'), $HOME . '\v/.{-}\zs/.*\ze', '', '')
	endif

	if isdirectory(l:root) && l:root !=# $HOME
		execute 'cd ' . l:root
	endif
endfunction
