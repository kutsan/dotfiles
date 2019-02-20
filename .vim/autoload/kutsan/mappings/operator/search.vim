""
" Search and replace operator.
"
" nnoremap <silent> go :set operatorfunc=kutsan#mappings#operator#search#<Enter>g@
" xnoremap <silent> go :<C-u>call kutsan#mappings#operator#search#(visualmode())<Enter>
"
" @param {string} [type] Type of motion.
""
function kutsan#mappings#operator#search#(type) abort
	" The operator doesn't support line-wise and block-wise motions.
	if index(['line', 'block', 'V', "\<C-v>"], a:type) !=# -1
		return v:false
	endif

	let l:save = {
		\ 'register': getreg('@')
	\ }

	if a:type ==# 'char'
		silent normal! `[v`]y
	elseif a:type ==# 'v'
		silent normal! gvy
	endif

	let l:query = getreg('@')
	call setreg('@', l:save.register)
	unlet l:save

	if line("'[") !=# line("']")
		return v:false
	endif

	let @/ = escape(l:query, '/\')

	call feedkeys(printf(':%%substitute//%s/gc', @/), 'n')
	call feedkeys("\<Left>\<Left>\<Left>", 'm')
endfunction
