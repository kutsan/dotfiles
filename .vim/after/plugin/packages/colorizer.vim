""
" High-performance color highlighter.
""

if !has('nvim')
	finish
endif

" Register autocmd FileType * hook.
lua require'colorizer'.setup()
