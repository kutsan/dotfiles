scriptencoding UTF-8

function! kutsan#statusline#linter() abort
	if !exists('g:loaded_ale')
		return ''
	endif

	let l:counts = ale#statusline#Count(bufnr(''))

	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_warnings = l:counts.total - l:all_errors

	return printf(' %d  %d', l:all_errors, l:all_warnings)
endfunction
