""
" Set current working directory to git root.
"
" autocmd VimEnter,BufEnter * call kutsan#autocmds#setroot#main()
""
function! kutsan#autocmds#setroot#main() abort
	let l:root = systemlist('git rev-parse --show-toplevel')[0]

	if !v:shell_error && l:root !=# $HOME
		execute 'cd' l:root
	endif
endfunction
