""
" Set current working directory to git root.
""
function! kutsan#autocmds#setprojectroot()
	let l:root = substitute(system('git rev-parse --show-toplevel'), '\n\+$', '', '')

	if isdirectory(l:root) && l:root !=# $HOME
		execute 'cd' l:root
	endif
endfunction
