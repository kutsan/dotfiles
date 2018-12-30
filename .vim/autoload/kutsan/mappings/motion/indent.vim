""
" Allow indented text blocks to be treated as text objects.
"
" onoremap <silent> ii :<C-u>call kutsan#mappings#motion#indent#({ 'motion': 'i' })<Enter>
" xnoremap <silent> ii :<C-u>call kutsan#mappings#motion#indent#({ 'motion': 'i' })<Enter>
" onoremap <silent> ai :<C-u>call kutsan#mappings#motion#indent#({ 'motion': 'a' })<Enter>
" xnoremap <silent> ai :<C-u>call kutsan#mappings#motion#indent#({ 'motion': 'a' })<Enter>
"
" @param {dictionary} options Configuration dictionary.
" @param {string} options.motion Motion to select text, whether 'a' or 'i'.
""
function! kutsan#mappings#motion#indent#(options) abort
	normal! ^
	let l:virtcol = virtcol(getline('.') =~# '\v\c^\s*$' ? '$' : '.')

	" Don't select entire buffer if no indentation found at current position.
	if l:virtcol ==# 1
		return v:false
	endif

	let l:pattern = printf('\v\c^(\s*%%%sv|^$)@!', l:virtcol)
	let l:start = search(l:pattern, 'bWn') + 1
	let l:end = search(l:pattern, 'Wn') - 1

	" Exclude or include empty lines depending on motion.
	if a:options.motion ==# 'a'
		execute printf('normal! %sG0V%sG$o', l:start, l:end)

	elseif a:options.motion ==# 'i'
		execute printf('normal! %sG0', l:start)
		call search('\v\c^[^\n\r]', 'Wc')

		execute printf('normal! Vo%sG', l:end)
		call search('\v\c^[^\n\r]', 'bWc')

		normal! $o
	endif
endfunction
