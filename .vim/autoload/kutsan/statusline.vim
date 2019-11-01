scriptencoding UTF-8

function! kutsan#statusline#linter() abort
	if !exists('g:loaded_ale')
		return ''
	endif

	let l:counts = ale#statusline#Count(bufnr(''))

	let l:allerrors = l:counts.error + l:counts.style_error
	let l:allwarnings = l:counts.total - l:allerrors

	return printf('𥉉%d  %d', l:allerrors, l:allwarnings)
endfunction

function! kutsan#statusline#fileprefix() abort
	let l:basename = expand('%:h')

	if l:basename ==# '' || l:basename ==# '.'
		return ''
	else
		return substitute(l:basename . '/', '\C^' . $HOME, '~', '')
	endif
endfunction

function! kutsan#statusline#filetypesymbol() abort
	if !exists('*WebDevIconsGetFileTypeSymbol')
		return ''
	endif

	return WebDevIconsGetFileTypeSymbol()
endfunction

function! kutsan#statusline#hlsearch() abort
	if !&hlsearch
		return ''
	endif

	return '' . ' '
endfunction

function! kutsan#statusline#spell() abort
	if !&spell
		return ''
	endif

	return '' . ' '
endfunction

function! kutsan#statusline#git() abort
	let s:head = ''

	if exists('g:loaded_fugitive')
		let s:head = fugitive#head(7)
	endif

	return printf('%s ', s:head)
endfunction

function! kutsan#statusline#markdownpreview() abort
	if !exists('b:markdownpreview')
		return ''
	endif

	return '' . ' '
endfunction

function! kutsan#statusline#nerdtree() abort
	if !exists('b:NERDTree')
		return v:false
	endif

	return substitute(b:NERDTree.root.path.str() . '/', '\C^' . $HOME, '~', '')
endfunction
