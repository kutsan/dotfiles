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

" User configuration. (Last updated at c183b25.)
let g:coc_user_config = {
	\ 'suggest': {
		\ 'maxPreviewWidth': 50,
		\ 'enablePreview': v:false,
		\ 'floatEnable': v:true,
		\ 'labelMaxLength': 200,
		\ 'detailMaxLength': 200,
		\ 'detailField': 'menu',
		\ 'autoTrigger': 'always',
		\ 'languageSourcePriority': 99,
		\ 'numberSelect': v:false,
		\ 'disableKind': v:true,
		\ 'disableMenu': v:true,
		\ 'disableMenuShortcut': v:true,
		\ 'snippetIndicator': ' [snippet]',
		\ 'maxCompleteItemCount': 20,
		\ 'preferCompleteThanJumpPlaceholder': v:false,
		\ 'fixInsertedWord': v:true,
		\ 'localityBonus': v:true,
		\ 'triggerAfterInsertEnter': v:false,
		\ 'timeout': 2000,
		\ 'minTriggerInputLength': 1,
		\ 'triggerCompletionWait': 60,
		\ 'echodocSupport': v:false,
		\ 'acceptSuggestionOnCommitCharacter': v:false,
		\ 'noselect': v:false,
		\ 'keepCompleteopt': v:true,
		\ 'completionItemKindLabels': {}
	\ },
	\ 'diagnostic': {
		\ 'enable': v:true,
		\ 'level': 'hint',
		\ 'checkCurrentLine': v:false,
		\ 'messageTarget': 'float',
		\ 'joinMessageLines': v:false,
		\ 'refreshOnInsertMode': v:false,
		\ 'refreshAfterSave': v:false,
		\ 'displayByAle': v:true,
		\ 'virtualText': v:true,
		\ 'virtualTextPrefix': '  ',
		\ 'virtualTextLines': 3,
		\ 'virtualTextLineSeparator': ' \\ ',
		\ 'enableSign': v:true,
		\ 'enableMessage': 'never',
		\ 'locationlist': v:true,
		\ 'highlightOffset': 1000,
		\ 'signOffset': 1000,
		\ 'errorSign': '•',
		\ 'warningSign': '•',
		\ 'infoSign': '•',
		\ 'hintSign': '•',
		\ 'maxWindowHeight': 5
	\ },
	\ 'signature': {
		\ 'enable': v:true,
		\ 'triggerSignatureWait': 50,
		\ 'target': 'float',
		\ 'floatTimeout': 1000,
		\ 'preferShownAbove': v:true,
		\ 'hideOnTextChange': v:false,
		\ 'maxWindowHeight': 8
	\ },
	\ 'codeLens': {
		\ 'enable': v:false,
		\ 'separator': ''
	\ },
	\ 'workspace': {
		\ 'ignoredFiletypes': ['markdown', 'log', 'txt', 'help']
	\ },
	\ 'list': {
		\ 'indicator': '>',
		\ 'maxHeight': 10,
		\ 'signOffset': 900,
		\ 'selectedSignText': '*',
		\ 'extendedSearchMode': v:true,
		\ 'autoResize': v:true,
		\ 'limitLines': 30000,
		\ 'maxPreviewHeight': 12,
		\ 'previewSplitRight': v:false,
		\ 'previewHighlightGroup': 'Search',
		\ 'nextKeymap': '<C-j>',
		\ 'previousKeymap': '<C-k>',
		\ 'normalMappings': {},
		\ 'insertMappings': {}
	\ },
	\ 'coc': {
		\ 'preferences': {
			\ 'useQuickfixForLocations': v:false,
			\ 'extensionUpdateCheck': 'daily',
			\ 'snippetStatusText': 'SNIP',
			\ 'hoverTarget': 'float',
			\ 'colorSupport': v:true,
			\ 'previewAutoClose': v:true,
			\ 'currentFunctionSymbolAutoUpdate': v:false,
			\ 'formatOnSaveFiletypes': [],
			\ 'enableFloatHighlight': v:false,
			\ 'rootPatterns': ['.vim', '.git'],
			\ 'watchmanPath': v:null,
			\ 'jumpCommand': 'edit',
			\ 'messageLevel': 'more',
			\ 'bracketEnterImprove': v:true,
			\ 'formatOnType': v:false,
			\ 'snippets.enable': v:true
		\ },
		\ 'source': {
			\ 'around': {
				\ 'enable': v:true,
				\ 'firstMatch': v:true,
				\ 'shortcut': 'A',
				\ 'priority': 1,
				\ 'disableSyntaxes': []
			\ },
			\ 'buffer': {
				\ 'enable': v:true,
				\ 'firstMatch': v:true,
				\ 'shortcut': 'B',
				\ 'priority': 1,
				\ 'disableSyntaxes': [],
				\ 'ignoreGitignore': v:true
			\ },
			\ 'file': {
				\ 'enable': v:true,
				\ 'shortcut': 'F',
				\ 'priority': 10,
				\ 'disableSyntaxes': [],
				\ 'triggerCharacters': '/',
				\ 'trimSameExts': ['.ts', '.js'],
				\ 'ignoreHidden': v:true,
				\ 'ignorePatterns': []
			\ },
			\ 'outline': {
				\ 'ctagsFilestypes': []
			\ }
		\ }
	\ },
	\ 'languageserver': {},
	\
	\ 'snippets': {
		\ 'priority': 200,
		\ 'shortcut': 'S',
		\ 'loadFromExtensions': v:false,
		\ 'ultisnips': {
			\ 'enable': v:true,
			\ 'directories': ['snippet']
		\ }
	\ },
	\ 'highlight': {
		\ 'disableLanguages': '',
		\ 'document.enable': v:true,
		\ 'colors.enable': v:true
	\ }
\ }

" Remap for rename current word.
nmap <Leader>c* <Plug>(coc-rename)

augroup cocsettings
	autocmd!

	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
