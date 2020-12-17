""
" Search text in git repository or current working directory.
"
" command -nargs=1 -bang Search call kutsan#commands#search#(<bang>v:false, <args>)
" nnoremap gs :Search ''<Left>
" nnoremap gS :Search! ''<Left>
"
" @param {boolean} [bang=v:false] Use 'grepprg' instead of `git grep`.
" @param {string} query Search query.
""
function! kutsan#commands#search#(bang, query) abort
	" Query can't be empty.
	if empty(a:query)
		echo ''
		return v:false
	endif

	" Keep cursor position before search command used under `S mark.
	normal! mS

	" Use `git grep` as default and 'grepprg' as alternate method with bang.
	" Fallback to alternate method if `git` is not accessible.
	if !a:bang && executable('git')
		let l:save = {
			\ 'grepprg': &grepprg
		\ }
		let &grepprg = 'git grep --line-number -I --ignore-case --perl-regexp'
	endif

	execute printf('silent grep "%s"', a:query)

	if exists('l:save') && has_key(l:save, 'grepprg')
		let &grepprg = l:save.grepprg
		unlet l:save
	endif

	" Open quickfix buffer only if there are entries in it.
	cwindow

	if !empty(getqflist())
		" Add searched query to search history as vim regex compatible.
		let l:vimquery = '\v' .. a:query
		let @/ = l:vimquery
		call histadd('search', l:vimquery)

		" Enable highlighting and save its previous value.
		let b:savehlsearch = &hlsearch
		call feedkeys(":set hlsearch \<Bar> echo\<CR>", 'n')

		" Revert highlighting to its previous value after exiting quickfix.
		augroup search
			autocmd!
			autocmd BufUnload <buffer>
				\ if exists('b:savehlsearch') |
					\ silent let &hlsearch = b:savehlsearch |
					\ unlet b:savehlsearch |
				\ endif
		augroup end

		" Remove focus from quickfix buffer.
		wincmd p
	endif
endfunction
