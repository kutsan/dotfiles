""
" High-performance color highlighter.
""

if !has('nvim')
	finish
endif

" Register autocmd FileType * hook.
if !exists('$ANDROID_ROOT')
	lua require'colorizer'.setup()
endif
