scriptencoding UTF-8

""
" Define the string to be displayed for a closed folds.
"
" set foldtext=kutsan#settings#foldtext()
""
function! kutsan#settings#foldtext() abort
	let l:lines = v:foldend - v:foldstart + 1
	let l:first = substitute(getline(v:foldstart), '\v\c *', '', '')

	return printf(' +%s %s', l:lines, l:first)
endfunction

""
" Custom tabline modifier.
"
" set tabline=%!kutsan#settings#tabline()
""
function! kutsan#settings#tabline() abort
	let l:line = ''
	let l:current = tabpagenr()

	for l:i in range(1, tabpagenr('$'))
		if l:i == l:current
			let l:line .= '%#TabLineSel#'
		else
			let l:line .= '%#TabLine#'
		endif

		let l:label = fnamemodify(
			\ bufname(tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]),
			\ ':t'
		\ )

		let l:line .= '%' .. i .. 'T' " Starts mouse click target region.
		let l:line .= '  ' .. l:label .. '  '
	endfor

	let l:line .= '%#TabLineFill#'
	let l:line .= '%T' " Ends mouse click target region(s).

	return l:line
endfunction
