""
" Toggle terminal buffer or create new one if there is none.
"
" nnoremap <silent> <C-z> :call kutsan#mappings#toggleterminal()<Enter>
" tnoremap <silent> <C-z> <C-\><C-n>:call kutsan#mappings#toggleterminal()<Enter>
""
function! kutsan#mappings#toggleterminal() abort
	if !has('nvim')
		return v:false
	endif

	" Create the terminal buffer.
	if !exists('g:terminal') || !g:terminal.term.loaded
		return kutsan#terminal#create()
	endif

	" Go back to origin buffer if current buffer is terminal.
	if g:terminal.term.bufferid ==# bufnr('')
		silent execute 'buffer' g:terminal.origin.bufferid

	" Launch terminal buffer and start insert mode.
	else
		let g:terminal.origin.bufferid = bufnr('')

		silent execute 'buffer' g:terminal.term.bufferid
		startinsert
	endif
endfunction

""
" Construct the range with given motion. Emulates `!` (exclamation) operator
" without putting '!' symbol automatically in the command mode.
"
" nnoremap <silent> ! :<C-u>set operatorfunc=kutsan#mappings#exclamationoperator<CR>g@
"
" @param {string} [type] Type of motion.
""
function! kutsan#mappings#exclamationoperator(type) abort
	let [l:mstart, l:mend] = [line("'["), line("']")]

	if l:mstart == line('.')
		let [l:mstart, l:mend] = ['.', '.+' . (l:mend - l:mstart)]
	endif

	call feedkeys(':' . l:mstart . ',' . l:mend, 'in')
endfunction

""
" Set search register to current visual selection.
"
" xnoremap * :<C-u>call kutsan#mappings#visualsetsearch('/')<Enter>/<C-r>=@/<Enter><Enter>
" xnoremap # :<C-u>call kutsan#mappings#visualsetsearch('?')<Enter>?<C-r>=@/<Enter><Enter>
"
" @param {string} searchtype Direction for search command, either '/' or '?'.
""
function! kutsan#mappings#visualsetsearch(searchtype) abort
	let l:temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, a:searchtype . '\'), '\n', '\\n', 'g')
	let @s = l:temp
endfunction

""
" Execute given motion or selection in appropriate REPL.
"
" nnoremap <silent> gx :<C-u>let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#executeoperator<Enter>g@
" nnoremap <silent> gxl :<C-u>let b:executeoperatorview = winsaveview() <Bar> set operatorfunc=kutsan#mappings#executeoperator <Bar> execute 'normal!' v:count 'g@_'<Enter>
" vnoremap <silent> gx :<C-u>call kutsan#mappings#executeoperator(visualmode(), 1)<Enter>
"
" @param {string} type Type of motion.
" @param {boolean} [visualmode] Whether or not invoking from visual mode.
""
function! kutsan#mappings#executeoperator(type, ...) abort
	let l:visualmode = a:0 == 1 ? a:1 : v:null

	if l:visualmode
		silent execute 'normal! gvy'
	elseif a:type ==? 'line'
		silent execute "normal! '[V']y"
	else
		silent execute 'normal! `[v`]y'
	endif

	let l:executecontent = @@
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

""
" Toggle zoom current buffer in the new tab.
"
" nnoremap <silent> <Leader>z :call kutsan#mappings#togglezoom()<Enter>
""
function! kutsan#mappings#togglezoom() abort
	if winnr('$') > 1
		tab split
	elseif
		\ len(
			\ filter(
				\ map(
					\ range(tabpagenr('$')),
					\ 'tabpagebuflist(v:val + 1)'
				\ ),
				\ printf('index(v:val, %s) >= 0', bufnr(''))
			\ )
		\ ) > 1
		tabclose
	endif
endfunction
