""
" Execute given motion or selection in appropriate REPL.
"
" nnoremap <silent> gx :<C-u>let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#operator#execute#<Enter>g@
" xnoremap <silent> gx :<C-u>call kutsan#mappings#operator#execute#(visualmode())<Enter>
"
" @param {string} type Type of motion.
""
function! kutsan#mappings#operator#execute#(type) abort
	if !has('nvim')
		return v:false
	endif

	let l:save = {
		\ 'register': getreg('@')
	\ }

	if a:type ==? 'v'
		silent normal! gvy
	else
		silent normal! `[V`]y
	endif

	let l:executecontent = getreg('@')

	call setreg('@', l:save.register)
	unlet l:save

	let l:executefunctions = {}

	function! l:executefunctions.javascript() abort closure
		let l:process = {}
		let l:swap = v:null

		function! l:process.on_stdout(jobid, data, event) abort closure
			if !l:swap
				" Fix weird behavior of Node REPL prompt.
				call feedkeys("\<Space>\<BS>")
				let l:swap = v:true
			endif
		endfunction

		function! l:process.on_exit(jobid, data, event) abort
			silent execute 'bdelete!' bufnr('')
		endfunction

		new
		call termopen(printf('node --interactive --print "%s"', l:executecontent), l:process)
	endfunction

	function! l:executefunctions.vim() abort closure
		execute(l:executecontent)
	endfunction

	let l:filetype = split(&filetype, '\v\c\.')[0]

	if has_key(l:executefunctions, l:filetype)
		call l:executefunctions[l:filetype]()
	endif

	if exists('b:executeoperatorview')
		call winrestview(b:executeoperatorview)
		unlet b:executeoperatorview
	endif
endfunction
