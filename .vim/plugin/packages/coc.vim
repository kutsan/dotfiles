scriptencoding UTF-8

" List of extensions.
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-tag',
	\ 'coc-stylelintplus',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-snippets'
\ ]

" User configuration.
let g:coc_user_config = {
	\ 'suggest': {
		\ 'maxPreviewWidth': 50,
		\ 'keepCompleteopt': v:true,
		\ 'floatEnable': v:false
	\ },
	\ 'diagnostic': {
		\ 'checkCurrentLine': v:true,
		\ 'enableHighlightLineNumber': v:false,
		\ 'errorSign': '•',
		\ 'warningSign': '•',
		\ 'infoSign': '•',
		\ 'hintSign': '•'
	\ },
	\ 'css': {
		\ 'validate': v:false
	\ },
	\ 'javascript': {
		\ 'validate': {
			\ 'enable': v:false
		\ }
	\ },
	\ 'snippets': {
		\ 'priority': 200,
		\ 'ultisnips': {
			\ 'directories': ['snippet']
		\ },
		\ 'extends': {
			\ "javascriptreact": ["javascript"]
		\ },
	\ },
\ }

" Mappings.
nmap <Leader>c* <Plug>(coc-rename)
nmap <Leader>cr <Plug>(coc-refactor)
nmap <silent> <Leader>gd <Plug>(coc-definition)

augroup cocsettings
	autocmd!

	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
