""
" Search and replace operator.
"
" nnoremap <silent> go :set operatorfunc=kutsan#mappings#operator#search#<Enter>g@
" xnoremap <silent> go :<C-u>call kutsan#mappings#operator#search#(visualmode())<Enter>
"
" @param {string} [type] Type of motion.
""
function kutsan#mappings#operator#search#(type) abort
	" Line-wise motion is not supported.
	if a:type ==? 'line'
		return v:false
	endif

	let l:save = {
		\ 'register': getreg('@')
	\ }

	if a:type ==? 'v'
		silent normal! gvy
	else
		silent normal! `[v`]y
	endif

	let l:query = getreg('@')

	call setreg('@', l:save.register)
	unlet l:save

	let @/ = substitute(escape(l:query, '/\'), '\n', '\\n', 'g')

	call feedkeys(printf(':%%substitute//%s/gc', escape(l:query, '/')), 'n')
	call feedkeys("\<Left>\<Left>\<Left>", 'm')
endfunction
