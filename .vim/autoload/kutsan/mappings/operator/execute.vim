""
" Execute given motion or selection in appropriate REPL.
"
" nnoremap <silent> gx :<C-u>let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#operator#execute#main<Enter>g@
" vnoremap <silent> gx :<C-u>call kutsan#mappings#operator#execute#main(visualmode())<Enter>
" nnoremap <silent> gxl :<C-u>let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#operator#execute#main <Bar> execute 'normal!' v:count 'g@_'<Enter>
"
" @param {string} type Type of motion.
""
function! kutsan#mappings#operator#execute#main(type) abort
	let l:saveregister = getreg('@')

	if a:type =~? 'v'
		silent execute 'normal! gvy'
	elseif a:type ==? 'line'
		silent execute "normal! '[V']y"
	else
		silent execute 'normal! `[v`]y'
	endif

	let l:executecontent = getreg('@')

	call setreg('@', l:saveregister)
	unlet l:saveregister

	let l:executefunctions = {}

	function! l:executefunctions.javascript() abort closure
		let l:termopts = {}
		let l:swap = v:null

		function! l:termopts.on_stdout(jobid, data, event) abort closure
			if !l:swap
				" Fix weird behavior of Node REPL prompt.
				call feedkeys("\<Space>\<BS>")
				let l:swap = v:true
			endif
		endfunction

		function! l:termopts.on_exit(jobid, data, event) abort
			silent execute 'bdelete!' bufnr('')
		endfunction

		new
		call termopen(printf('node --interactive --print "%s"', l:executecontent), l:termopts)
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
