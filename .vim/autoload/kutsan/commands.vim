""
" Open documentations in browser for given query.
"
" @param {string} query Search query for documentation.
""
function! kutsan#commands#docs(query) abort
	call system(
		\ printf(
			\ '%s "https://devdocs.io/?q=%s"',
			\ executable('reopen') ? 'reopen' : 'xdg-open',
			\ a:query
		\ )
	\ )
endfunction

""
" Start profiling until it's invoked with ! modifier once again.
"
" command! -bang Profile call kutsan#commands#profile(<bang>0)
"
" @param {boolean} bang Stop profiling and quit without triggering events.
""
function! kutsan#commands#profile(bang) abort
	if !a:bang
		profile start ~/.vim/cache/log/profile.log
		profile func *
		profile file *
	else
		profile pause
		noautocmd qall
	endif
endfunction

""
" Display the contents of all registers in vertical split like `:registers`.
"
" command! Registers call kutsan#commands#registers()
""
function! kutsan#commands#registers() abort
	let l:buffercurrent = @%
	let l:bufferalternate = @#

	vertical botright 50new

	let l:registers = [
		\ { 'type': 'Special', 'tokens': ['"', '*', '+', '-'] },
		\ { 'type': 'Read-only', 'tokens': ['.', '%', '#', '/', ':'] },
		\ { 'type': 'Numbered', 'tokens': map(range(0, 9), 'string(v:val)') },
		\ { 'type': 'Named', 'tokens': map(range(97, 97 + 25), 'nr2char(v:val)') }
	\ ]

	for l:registergroup in l:registers
		call append(line('$'), l:registergroup.type . ':')

		for l:token in l:registergroup.tokens
			try
				if l:token ==# '%'
					let l:tokenvalue = l:buffercurrent
				elseif l:token ==# '#'
					let l:tokenvalue = l:bufferalternate
				else
					let l:tokenvalue = eval('@' . l:token)[:&columns]
				endif

				if empty(l:tokenvalue)
					continue
				endif

				call append(line('$'), printf(' %s: %s', l:token, l:tokenvalue))
			catch

			endtry
		endfor

		call append(line('$'), '')
	endfor

	setlocal nonumber norelativenumber
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nomodifiable
	setlocal nowrap
	setlocal nofoldenable
	setlocal statusline=Registers

	syntax clear

	syntax match registersType /\v\c^[A-Za-z-]*/ contained
	syntax match registersTypeColon /\v\c^[A-Za-z-]*:/ contains=registersType
	highlight default link registersType Title
	highlight default link registersTypeColon NonText

	syntax match registersToken /\v\c^\s./ contained
	syntax match registersTokenColon /\v\c^\s.:/ contains=registersToken
	highlight default link registersToken Label
	highlight default link registersTokenColon NonText
endfunction

""
" Search text in git repository or current working directory.
"
" command -nargs=1 -bang Search call kutsan#commands#search(<args>, <bang>v:false)
" nnoremap gs :Search ''<Left>
" nnoremap gS :Search! ''<Left>
"
" @param {string} query Search query.
" @param {boolean} [bang=v:false] Use 'grepprg' instead of `git grep`.
""
function! kutsan#commands#search(query, bang) abort
	" Use `git grep` as default and 'grepprg' as alternate method with bang.
	try
		if !a:bang && executable('git')
			let l:savegrepprg = &grepprg
			let &grepprg = 'git grep --line-number -I --ignore-case --perl-regexp'
		endif

		execute printf('silent grep "%s"', a:query)
	finally
		if exists('l:savegrepprg')
			let &grepprg = l:savegrepprg
			unlet l:savegrepprg
		endif
	endtry

	" Open quickfix buffer only if there are entries.
	cwindow

	if !empty(getqflist())
		" Add searched query to search history as vim regex compatible.
		let l:vimquery = '\v' . a:query
		let @/ = l:vimquery
		call histadd('search', l:vimquery)

		" Enable highlighting and save its previous value.
		let b:savehlsearch = &hlsearch
		call feedkeys(":set hlsearch \<Bar> echo\<Enter>", 'n')

		" Revert highlighting to its previous value after exiting quickfix.
		augroup quickfixrestoresettings
			autocmd!
			autocmd BufUnload <buffer>
				\ silent let &hlsearch = b:savehlsearch |
				\ unlet b:savehlsearch
		augroup end

		" Remove focus from quickfix buffer.
		wincmd p
	endif
endfunction
