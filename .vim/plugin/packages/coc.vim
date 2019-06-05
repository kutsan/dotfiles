""
" Context-aware completion engine.
""

scriptencoding UTF-8

" Disable automatically opening quickfix list upon errors.
let g:coc_auto_copen = v:false

" List of extensions.
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-highlight',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-snippets',
	\ 'coc-stylelint',
	\ 'coc-tag',
	\ 'coc-tsserver'
\ ]

" User configuration.
let g:coc_user_config = {
	\ 'suggest': {
		\ 'autoTrigger': 'always',
		\ 'triggerAfterInsertEnter': v:false,
		\ 'timeout': 2000,
		\ 'noselect': v:false,
		\ 'keepCompleteopt': v:true,
		\ 'minTriggerInputLength': 1,
		\ 'acceptSuggestionOnCommitCharacter': v:true,
		\ 'snippetIndicator': ' [snippet]',
		\ 'enablePreview': v:false,
		\ 'messageLevel': 'error',
		\ 'numberSelect': v:false,
		\ 'fixInsertedWord': v:true,
		\ 'jumpCommand': 'split',
		\ 'hoverTarget': 'float'
	\ },
	\ 'diagnostic': {
		\ 'displayByAle': v:true,
		\ 'enable': v:true,
		\ 'signOffset': 1000,
		\ 'errorSign': '•',
		\ 'warningSign': '•',
		\ 'infoSign': '•',
		\ 'hintSign': '•',
		\ 'virtualText': v:true,
		\ 'virtualTextPrefix': '  ',
		\ 'enableMessage': 'never'
	\ },
	\ 'codeLens': {
		\ 'enable': v:false
	\ },
	\ 'snippets': {
		\ 'priority': 200,
		\ 'shortcut': 'S',
		\ 'loadFromExtensions': v:false,
		\ 'ultisnips': {
			\ 'enable': v:true,
			\ 'directories': ['snippet']
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
