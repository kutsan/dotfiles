""
" Context-aware completion engine.
""

" Remap for rename current word
nmap <Leader>c* <Plug>(coc-rename)

augroup cocsettings
	autocmd!

	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
