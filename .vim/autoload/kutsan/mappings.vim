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
	if !exists('g:terminal') || !g:terminal.loaded
		return kutsan#terminal#create()
	endif

	" Go back to origin buffer if current buffer is terminal.
	if g:terminal.termbufferid ==# bufnr('')
		silent execute 'buffer' g:terminal.originbufferid

	" Launch terminal buffer and start insert mode.
	else
		let g:terminal.originbufferid = bufnr('')
		silent execute 'buffer' g:terminal.termbufferid
		startinsert
	endif
endfunction

""
" Construct the range with given motion. Emulates `!` (exclamation) operator
" without putting '!' symbol automatically in the command mode.
"
" nnoremap <silent> ! :<C-u>set operatorfunc=kutsan#mappings#exclamationoperator<CR>g@
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
""
function! kutsan#mappings#visualsetsearch(searchtype)
	let l:temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, a:searchtype . '\'), '\n', '\\n', 'g')
	let @s = l:temp
endfunction
