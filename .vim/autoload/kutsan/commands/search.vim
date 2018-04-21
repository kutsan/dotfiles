""
" Search text in git repository or current working directory.
"
" command -nargs=1 -bang Search call kutsan#commands#search#main(<args>, <bang>v:false)
" nnoremap gs :Search ''<Left>
" nnoremap gS :Search! ''<Left>
"
" @param {string} query Search query.
" @param {boolean} [bang=v:false] Use 'grepprg' instead of `git grep`.
""
function! kutsan#commands#search#main(query, bang) abort
	" Keep cursor position before search command used under `S mark.
	normal! mS

	" Use `git grep` as default and 'grepprg' as alternate method with bang.
	" Fallback to alternate method if `git` is not accessible.
	if !a:bang && executable('git')
		let l:savegrepprg = &grepprg
		let &grepprg = 'git grep --line-number -I --ignore-case --perl-regexp'
	endif

	execute printf('silent grep "%s"', a:query)

	if exists('l:savegrepprg')
		let &grepprg = l:savegrepprg
		unlet l:savegrepprg
	endif

	" Open quickfix buffer only if there are entries in it.
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
		autocmd BufUnload <buffer>
			\ if exists('b:savehlsearch') |
				\ silent let &hlsearch = b:savehlsearch |
				\ unlet b:savehlsearch |
			\ endif

		" Remove focus from quickfix buffer.
		wincmd p
	endif
endfunction
