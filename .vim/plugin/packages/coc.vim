""
" Context-aware completion engine.
""

scriptencoding UTF-8

" Disable automatically opening quickfix list upon errors.
let g:coc_auto_copen = v:false

" User configuration.
let g:coc_user_config = {
	\ 'coc': {
		\ 'preferences': {
			\ 'autoTrigger': 'always',
			\ 'triggerAfterInsertEnter': v:false,
			\ 'timeout': 2000,
			\ 'noselect': v:false,
			\ 'formatOnType': v:false,
			\ 'preferCompleteThanJumpPlaceholder': v:false,
			\ 'messageLevel': 'warning',
			\ 'numberSelect': v:false,
			\ 'fixInsertedWord': v:true,
			\ 'openResourceCommand': 'split',
			\ 'jumpCommand': 'split',
			\ 'codeLens': {
				\ 'enable': v:false
			\ },
			\ 'diagnostic': {
				\ 'enable': v:true,
				\ 'signOffset': 1000,
				\ 'errorSign': '•',
				\ 'warningSign': '•',
				\ 'infoSign': '•',
				\ 'hintSign': '•',
				\ 'virtualText': v:true
			\ }
		\ }
	\ }
\ }

" Remap for rename current word.
nmap <Leader>c* <Plug>(coc-rename)

augroup cocsettings
	autocmd!

	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
