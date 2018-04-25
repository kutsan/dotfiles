""
" Toggle relative numbers in Insert/Normal mode.
"
" autocmd InsertLeave,BufEnter,WinEnter,FocusGained * call kutsan#autocmds#togglenumbers#('setlocal relativenumber')
" autocmd InsertEnter,BufLeave,WinLeave,FocusLost * call kutsan#autocmds#togglenumbers#('setlocal norelativenumber')
"
" @param {string} command Command to be executed on toggle.
""
function! kutsan#autocmds#togglenumbers#(command) abort
	if &l:number && empty(&buftype)
		execute a:command
	endif
endfunction
