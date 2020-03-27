""
" Context-aware completion engine.
""

scriptencoding UTF-8

" List of extensions.
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-tag',
	\ 'coc-snippets',
	\ 'coc-stylelint',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-emmet'
\ ]

" User configuration.
let g:coc_user_config = {
	\ 'suggest': {
		\ 'maxPreviewWidth': 50,
		\ 'keepCompleteopt': v:true
	\ },
	\ 'diagnostic': {
		\ 'virtualText': v:true,
		\ 'virtualTextPrefix': '  ',
		\ 'errorSign': '•',
		\ 'warningSign': '•',
		\ 'infoSign': '•',
		\ 'hintSign': '•'
	\ },
	\ 'snippets': {
		\ 'priority': 200,
		\ 'ultisnips': {
			\ 'directories': ['snippet']
		\ },
		\ 'extends': {
			\ "javascriptreact": ["javascript"]
		\ }
	\ }
\ }

" Mappings.
nmap <Leader>c* <Plug>(coc-rename)
nmap <Leader>cr <Plug>(coc-refactor)
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Backspace> <Plug>(coc-range-select)
xmap <silent> <Backspace> <Plug>(coc-range-select)
nnoremap <silent> <Leader><C-f> :<C-u>CocList --top outline<Enter>
nnoremap <silent> <LocalLeader>f :CocCommand prettier.formatFile<Enter>

augroup cocsettings
	autocmd!

	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

	" Highlight current symbol.
	autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end
