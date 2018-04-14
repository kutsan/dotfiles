""
" Launch table of contents to the left as vertical pane for manual pages.
"
" autocmd FileType man call kutsan#autocmds#manshowtoc#main()
""
function! kutsan#autocmds#manshowtoc#main() abort
	if !has('nvim')
		return v:false
	endif

	call man#show_toc()

	setlocal nonumber norelativenumber
	setlocal laststatus=0

	nnoremap <buffer> l <Enter>zt
	nnoremap <buffer> q :quitall<Enter>

	wincmd H
	vert resize 35
	wincmd p
endfunction
