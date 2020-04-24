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
	\ 'coc-stylelintplus',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-emmet'
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
		\ },
	\ },
	\ 'emmet': {
		\ 'excludeLanguages': ['markdown', 'css']
	\ },
	\ 'css': {
		\ 'validate': v:false
	\ },
	\ 'stylelintplus': {
		\ 'autoFixOnFormat': v:true
	\ },
	\ 'prettier': {
		\ 'disableLanguages': ['css']
	\ }
\ }

" Mappings.
nmap <Leader>c* <Plug>(coc-rename)
nmap <Leader>cr <Plug>(coc-refactor)
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <LocalLeader>f <Plug>(coc-format)

augroup cocsettings
	autocmd!

	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
