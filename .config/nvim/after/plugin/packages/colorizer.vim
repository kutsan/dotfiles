" Register autocmd FileType * hook.
if has('nvim-0.5.0') && exists('g:loaded_colorizer')
	lua require('colorizer').setup()
endif
