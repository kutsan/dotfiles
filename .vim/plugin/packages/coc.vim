""
" Context-aware completion engine.
""

" Disable automatically opening quickfix list upon errors.
let g:coc_auto_copen = v:false

" Remap for rename current word
nmap <Leader>c* <Plug>(coc-rename)

augroup cocsettings
	autocmd!

	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
