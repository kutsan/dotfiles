if !has('nvim')
	finish
endif

" Register autocmd FileType * hook.
if exists('g:loaded_colorizer')
	lua require('colorizer').setup()
endif
