""
" Modified version of man#show_toc() and ftplugin/qf.vim's s:setup_toc().
""
function! kutsan#ftplugin#man#showtoc() abort
	if !has('nvim')
		return v:false
	endif

	let l:bufname = bufname('%')
	let l:info = getloclist(0, {'winid': 1})

	if !empty(l:info) && getwinvar(l:info.winid, 'qf_toc') ==# l:bufname
		lopen
		return v:true
	endif

	let l:toc = []
	let l:lnum = 2
	let l:last_line = line('$') - 1

	while l:lnum && l:lnum < l:last_line
		let l:text = getline(l:lnum)

		if l:text =~# '^\%( \{3\}\)\=\S.*$'
			call add(l:toc, { 'bufnr': bufnr('%'), 'lnum': l:lnum, 'text': l:text })
		endif

		let l:lnum = nextnonblank(l:lnum + 1)
	endwhile

	call setloclist(0, l:toc, ' ')
	call setloclist(0, [], 'a', {'title': 'Man TOC'})

	vertical leftabove lopen
	vert resize 35
	setlocal winfixwidth
	setlocal nonumber norelativenumber

	nnoremap <buffer><silent> l <Enter>zt
	nnoremap <buffer><silent> <Enter> <Enter>zt

	let l:list = getloclist(0)
	if empty(l:list)
		return v:false
	endif

	let l:bufnr = l:list[0].bufnr
	setlocal modifiable
	silent 1,$delete _
	call setline(1, map(l:list, 'v:val.text'))
	setlocal nomodifiable nomodified
	let &syntax = getbufvar(l:bufnr, '&syntax')

	let w:qf_toc = l:bufname

	wincmd x
endfunction

function! kutsan#ftplugin#man#jumptag() abort
	if !has('nvim')
		return v:false
	endif

	call man#open_page(v:false, 1, '')
endfunction

function! kutsan#ftplugin#man#poptag() abort
	if !has('nvim')
		return v:false
	endif

	call man#pop_tag()
endfunction
