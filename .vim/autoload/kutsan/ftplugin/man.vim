""
" Show table of contents window.
" Modified version of man#show_toc() and ftplugin/qf.vim's s:setup_toc().
"
" nnoremap <buffer><silent> gO :call kutsan#ftplugin#man#showtoc()<CR>
""
function! kutsan#ftplugin#man#showtoc() abort
	if !has('nvim')
		return v:false
	endif

	let l:bufname = bufname('%')
	let l:info = getloclist(0, { 'winid': 1 })

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
	call setloclist(0, [], 'a', { 'title': 'Man TOC' })

	" Prepare and set options for the window.
	vertical leftabove lopen
	vert resize 35
	setlocal winfixwidth
	setlocal nonumber norelativenumber

	" Define mappings.
	nnoremap <buffer><silent> l <CR>zt
	nnoremap <buffer><silent> <CR> <CR>zt

	" Abort if there is nothing to show.
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

	" Move the window to the other side.
	wincmd x
endfunction

""
" Open man page under the cursor.
"
" nnoremap <buffer><silent> <C-]> :call kutsan#ftplugin#man#jumptag()<CR>
""
function! kutsan#ftplugin#man#jumptag() abort
	if !has('nvim')
		return v:false
	endif

	call man#open_page(v:false, 1, '')
endfunction

""
" Jump to the previous entry in tag stack.
"
" nnoremap <buffer><silent> [g :call kutsan#ftplugin#man#poptag()<CR>
""
function! kutsan#ftplugin#man#poptag() abort
	if !has('nvim')
		return v:false
	endif

	call man#pop_tag()
endfunction
