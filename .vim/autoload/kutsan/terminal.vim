""
" Create the terminal buffer.
""
function! kutsan#terminal#create() abort
	if !has('nvim')
		return v:false
	endif

	if !exists('g:terminal')
		let g:terminal = {
			\ 'loaded': v:null,
			\ 'termbufferid': v:null,
			\ 'originbufferid': v:null
		\ }

		function! g:terminal.on_exit(jobid, data, event)
			silent execute 'buffer' g:terminal.originbufferid
			silent execute 'bdelete!' g:terminal.termbufferid

			let g:terminal.loaded = v:null
			let g:terminal.termbufferid = v:null
			let g:terminal.originbufferid = v:null
		endfunction
	endif

	if g:terminal.loaded
		return v:false
	endif

	let g:terminal.originbufferid = bufnr('')

	enew
	call termopen(&shell, g:terminal)

	let g:terminal.loaded = v:true
	let g:terminal.termbufferid = bufnr('')
endfunction

""
" Execute given command in new tmux window inside terminal buffer. Expects
" `call termopen(&shell)` would open a new tmux session named 'nvim'.
"
" @param {string} command Command to run.
""
function! kutsan#terminal#execute(command) abort
	if !has('nvim')
		return v:false
	endif

	if !executable('tmux')
		return v:false
	endif

	if !exists('g:terminal') || !g:terminal.loaded
		call kutsan#terminal#create()

		" Wait for tmux to get ready.
		sleep 500m
	endif

	let l:tmuxsessionname = 'nvim'

	call system(printf('tmux has-session -t %s', l:tmuxsessionname))
	if v:shell_error == 0
		call system(printf('tmux new-window -t "%s:" "%s"', l:tmuxsessionname, a:command))
		silent execute 'buffer' g:terminal.termbufferid
		startinsert
	endif
endfunction
