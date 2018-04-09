""
" Create the terminal buffer.
""
function! kutsan#terminal#create() abort
	if !has('nvim')
		return v:false
	endif

	if !exists('g:terminal')
		let g:terminal = {
			\ 'opts': {},
			\ 'term': {
				\ 'loaded': v:null,
				\ 'bufferid': v:null
			\ },
			\ 'origin': {
				\ 'bufferid': v:null
			\ }
		\ }

		function! g:terminal.opts.on_exit(jobid, data, event) abort
			silent execute 'buffer' g:terminal.origin.bufferid
			silent execute 'bdelete!' g:terminal.term.bufferid

			let g:terminal.term.loaded = v:null
			let g:terminal.term.bufferid = v:null
			let g:terminal.origin.bufferid = v:null
		endfunction
	endif

	if g:terminal.term.loaded
		return v:false
	endif

	let g:terminal.origin.bufferid = bufnr('')

	enew
	call termopen(&shell, g:terminal.opts)

	let g:terminal.term.loaded = v:true
	let g:terminal.term.bufferid = bufnr('')
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

	if !exists('g:terminal') || !g:terminal.term.loaded
		call kutsan#terminal#create()

		" Wait for tmux to get ready.
		sleep 500m
	endif

	call system('tmux has-session -t nvim')
	if v:shell_error == 0
		call system(printf('tmux new-window -t "nvim:" %s', shellescape(a:command)))
		silent execute 'buffer' g:terminal.term.bufferid
		startinsert
	endif
endfunction
