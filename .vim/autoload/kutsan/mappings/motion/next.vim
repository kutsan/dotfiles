""
" Execute a motion on the next or last text object.
"
" onoremap <silent> an :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'f' })<Enter>
" xnoremap <silent> an :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'f' })<Enter>
" onoremap <silent> in :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'f' })<Enter>
" xnoremap <silent> in :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'f' })<Enter>
" onoremap <silent> al :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'F' })<Enter>
" xnoremap <silent> al :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'F' })<Enter>
" onoremap <silent> il :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'F' })<Enter>
" xnoremap <silent> il :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'F' })<Enter>
"
" @param {dictionary} options Configuration dictionary.
" @param {string} options.motion Motion to select text, whether 'a' or 'i'.
" @param {string} options.direction Direction to operate, whether 'f' or 'F'.
""
function! kutsan#mappings#motion#next#(options) abort
	let l:char = nr2char(getchar())

	if l:char ==# 'b'
		let l:char = '('
	elseif l:char ==# 'B'
		let l:char = '{'
	endif

	execute printf(
		\ 'silent normal! %s%sv%s%s',
		\ a:options.direction, l:char, a:options.motion, l:char
	\ )
endfunction
