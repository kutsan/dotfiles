""
" Iceberg, dark blue color scheme.
"
" @see github:cocopon/iceberg.vim
" @version 8b5ca00
""

if !has('gui_running') && &t_Co < 256
	finish
endif

set background=dark
highlight clear

if exists('g:syntax_on')
	syntax reset
endif

let g:colors_name = 'iceberg'

highlight! ColorColumn cterm=NONE ctermbg=235 guibg=#1e2132
highlight! CursorColumn cterm=NONE ctermbg=235 guibg=#1e2132
highlight! CursorLine cterm=NONE ctermbg=235 guibg=#1e2132
highlight! Comment ctermfg=242 guifg=#6b7089
highlight! Constant ctermfg=140 guifg=#a093c7
highlight! Cursor ctermbg=252 ctermfg=234 guibg=#c6c8d1 guifg=#161821
highlight! CursorLineNr ctermbg=237 ctermfg=253 guibg=#2a3158 guifg=#cdd1e6
highlight! Delimiter ctermfg=252 guifg=#c6c8d1
highlight! DiffAdd ctermbg=29 ctermfg=158 guibg=#45493e guifg=#c0c5b9
highlight! DiffChange ctermbg=23 ctermfg=159 guibg=#384851 guifg=#b3c3cc
highlight! DiffDelete ctermbg=95 ctermfg=224 guibg=#53343b guifg=#ceb0b6
highlight! DiffText cterm=NONE ctermbg=30 ctermfg=195 gui=NONE guibg=#5b7881 guifg=#c6c8d1
highlight! Directory ctermfg=109 guifg=#89b8c2
highlight! Error ctermbg=234 ctermfg=203 guibg=#161821 guifg=#e27878
highlight! ErrorMsg ctermbg=234 ctermfg=203 guibg=#161821 guifg=#e27878
highlight! WarningMsg ctermbg=234 ctermfg=203 guibg=#161821 guifg=#e27878
highlight! EndOfBuffer ctermbg=234 ctermfg=236 guibg=#161821 guifg=#242940
highlight! NonText ctermbg=234 ctermfg=236 guibg=#161821 guifg=#242940
highlight! SpecialKey ctermbg=234 ctermfg=236 guibg=#161821 guifg=#242940
highlight! Folded ctermbg=235 ctermfg=245 guibg=#1e2132 guifg=#686f9a
highlight! FoldColumn ctermbg=235 ctermfg=239 guibg=#1e2132 guifg=#444b71
highlight! Function ctermfg=110 guifg=#84a0c6
highlight! Identifier cterm=NONE ctermfg=109 guifg=#89b8c2
highlight! Include ctermfg=110 guifg=#84a0c6
highlight! LineNr ctermbg=235 ctermfg=239 guibg=#1e2132 guifg=#444b71
highlight! MatchParen ctermbg=237 ctermfg=255 guibg=#3e445e guifg=#ffffff
highlight! MoreMsg ctermfg=150 guifg=#b4be82
highlight! Normal ctermbg=234 ctermfg=252 guibg=#161821 guifg=#c6c8d1
highlight! Operator ctermfg=110 guifg=#84a0c6
highlight! Pmenu ctermbg=236 ctermfg=251 guibg=#3d425b guifg=#c6c8d1
highlight! PmenuSbar ctermbg=236 guibg=#3d425b
highlight! PmenuSel ctermbg=240 ctermfg=255 guibg=#5b6389 guifg=#eff0f4
highlight! PmenuThumb ctermbg=251 guibg=#c6c8d1
highlight! PreProc ctermfg=150 guifg=#b4be82
highlight! Question ctermfg=150 guifg=#b4be82
highlight! QuickFixLine ctermbg=236 ctermfg=252 guibg=#272c42 guifg=#c6c8d1
highlight! Search ctermbg=216 ctermfg=234 guibg=#e4aa80 guifg=#392313
highlight! SignColumn ctermbg=235 ctermfg=239 guibg=#1e2132 guifg=#444b71
highlight! Special ctermfg=150 guifg=#b4be82
highlight! SpellBad ctermbg=95 ctermfg=252 gui=undercurl guisp=#e27878
highlight! SpellCap ctermbg=24 ctermfg=252 gui=undercurl guisp=#84a0c6
highlight! SpellLocal ctermbg=23 ctermfg=252 gui=undercurl guisp=#89b8c2
highlight! SpellRare ctermbg=97 ctermfg=252 gui=undercurl guisp=#a093c7
highlight! Statement ctermfg=110 gui=NONE guifg=#84a0c6
highlight! StatusLine cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#17171b guifg=#818596 term=reverse
highlight! StatusLineTerm cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#17171b guifg=#818596 term=reverse
highlight! StatusLineNC cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#0f1117
highlight! StatusLineTermNC cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#0f1117
highlight! StorageClass ctermfg=110 guifg=#84a0c6
highlight! String ctermfg=109 guifg=#89b8c2
highlight! Structure ctermfg=110 guifg=#84a0c6
highlight! TabLine cterm=NONE ctermbg=245 ctermfg=234 gui=NONE guibg=#818596 guifg=#17171b
highlight! TabLineFill cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#17171b guifg=#818596
highlight! TabLineSel cterm=NONE ctermbg=234 ctermfg=252 gui=NONE guibg=#161821 guifg=#9a9ca5
highlight! Title ctermfg=216 gui=NONE guifg=#e2a478
highlight! Todo ctermbg=234 ctermfg=150 guibg=#45493e guifg=#b4be82
highlight! Type ctermfg=110 gui=NONE guifg=#84a0c6
highlight! Underlined cterm=underline ctermfg=110 gui=underline guifg=#84a0c6 term=underline
highlight! VertSplit cterm=NONE ctermbg=233 ctermfg=233 gui=NONE guibg=#0f1117 guifg=#0f1117
highlight! Visual ctermbg=236 guibg=#272c42
highlight! WildMenu ctermbg=255 ctermfg=234 guibg=#d4d5db guifg=#17171b
highlight! diffAdded ctermfg=150 guifg=#b4be82
highlight! diffRemoved ctermfg=203 guifg=#e27878
highlight! ALEErrorSign ctermbg=235 ctermfg=203 guibg=#1e2132 guifg=#e27878
highlight! ALEWarningSign ctermbg=235 ctermfg=216 guibg=#1e2132 guifg=#e2a478
highlight! ALEVirtualTextError ctermfg=203 guifg=#e27878
highlight! ALEVirtualTextWarning ctermfg=216 guifg=#e2a478
highlight! CtrlPMode1 ctermbg=241 ctermfg=234 guibg=#5a5f72 guifg=#17171b
highlight! EasyMotionShade ctermfg=239 guifg=#3d425b
highlight! EasyMotionTarget ctermfg=150 guifg=#b4be82
highlight! EasyMotionTarget2First ctermfg=216 guifg=#e2a478
highlight! EasyMotionTarget2Second ctermfg=216 guifg=#e2a478
highlight! GitGutterAdd ctermbg=235 ctermfg=150 guibg=#1e2132 guifg=#b4be82
highlight! GitGutterChange ctermbg=235 ctermfg=109 guibg=#1e2132 guifg=#89b8c2
highlight! GitGutterChangeDelete ctermbg=235 ctermfg=109 guibg=#1e2132 guifg=#89b8c2
highlight! GitGutterDelete ctermbg=235 ctermfg=203 guibg=#1e2132 guifg=#e27878
highlight! Sneak ctermbg=140 ctermfg=234 guibg=#a093c7 guifg=#161821
highlight! SneakScope ctermbg=236 ctermfg=242 guibg=#272c42 guifg=#6b7089
highlight! SyntasticErrorSign ctermbg=235 ctermfg=203 guibg=#1e2132 guifg=#e27878
highlight! SyntasticStyleErrorSign ctermbg=235 ctermfg=203 guibg=#1e2132 guifg=#e27878
highlight! SyntasticStyleWarningSign ctermbg=235 ctermfg=216 guibg=#1e2132 guifg=#e2a478
highlight! SyntasticWarningSign ctermbg=235 ctermfg=216 guibg=#1e2132 guifg=#e2a478
highlight! ZenSpace ctermbg=203 guibg=#e27878
highlight! icebergALAccentRed ctermfg=203 guifg=#e27878

highlight! link cssBraces Delimiter
highlight! link cssClassName Special
highlight! link cssClassNameDot Normal
highlight! link cssPseudoClassId Special
highlight! link cssTagName Statement
highlight! link helpHyperTextJump Constant
highlight! link htmlArg Constant
highlight! link htmlEndTag Statement
highlight! link htmlTag Statement
highlight! link jsonQuote Normal
highlight! link phpVarSelector Identifier
highlight! link pythonFunction Title
highlight! link rubyDefine Statement
highlight! link rubyFunction Title
highlight! link rubyInterpolationDelimiter String
highlight! link rubySharpBang Comment
highlight! link rubyStringDelimiter String
highlight! link sassClass Special
highlight! link shFunction Normal
highlight! link vimContinue Comment
highlight! link vimFuncSID vimFunction
highlight! link vimFuncVar Normal
highlight! link vimFunction Title
highlight! link vimGroup Statement
highlight! link vimHiGroup Statement
highlight! link vimHiTerm Identifier
highlight! link vimMapModKey Special
highlight! link vimOption Identifier
highlight! link vimVar Normal
highlight! link xmlAttrib Constant
highlight! link xmlAttribPunct Statement
highlight! link xmlEndTag Statement
highlight! link xmlNamespace Statement
highlight! link xmlTag Statement
highlight! link xmlTagName Statement
highlight! link yamlKeyValueDelimiter Delimiter
highlight! link CtrlPPrtCursor Cursor
highlight! link CtrlPMatch Title
highlight! link CtrlPMode2 StatusLine
highlight! link deniteMatched Normal
highlight! link deniteMatchedChar Title
highlight! link jsFlowMaybe Normal
highlight! link jsFlowObject Normal
highlight! link jsFlowType PreProc
highlight! link graphqlName Normal
highlight! link graphqlOperator Normal
highlight! link jsArrowFunction Operator
highlight! link jsClassDefinition Normal
highlight! link jsClassFuncName Title
highlight! link jsExport Statement
highlight! link jsFuncName Title
highlight! link jsFutureKeys Statement
highlight! link jsFuncCall Normal
highlight! link jsGlobalObjects Statement
highlight! link jsModuleKeywords Statement
highlight! link jsModuleOperators Statement
highlight! link jsNull Constant
highlight! link jsObjectFuncName Title
highlight! link jsObjectKey Identifier
highlight! link jsSuper Statement
highlight! link jsTemplateBraces Special
highlight! link jsUndefined Constant
highlight! link markdownBold Special
highlight! link markdownCode String
highlight! link markdownCodeDelimiter String
highlight! link markdownHeadingDelimiter Comment
highlight! link markdownRule Comment
highlight! link ngxDirective Statement
highlight! link plug1 Normal
highlight! link plug2 Identifier
highlight! link plugDash Comment
highlight! link plugMessage Special
highlight! link SignifySignAdd GitGutterAdd
highlight! link SignifySignChange GitGutterChange
highlight! link SignifySignChangeDelete GitGutterChangeDelete
highlight! link SignifySignDelete GitGutterDelete
highlight! link SignifySignDeleteFirstLine SignifySignDelete
highlight! link StartifyBracket Comment
highlight! link StartifyFile Identifier
highlight! link StartifyFooter Constant
highlight! link StartifyHeader Constant
highlight! link StartifyNumber Special
highlight! link StartifyPath Comment
highlight! link StartifySection Statement
highlight! link StartifySlash Comment
highlight! link StartifySpecial Normal
highlight! link svssBraces Delimiter
highlight! link swiftIdentifier Normal
highlight! link typescriptAjaxMethods Normal
highlight! link typescriptBraces Normal
highlight! link typescriptEndColons Normal
highlight! link typescriptFuncKeyword Statement
highlight! link typescriptGlobalObjects Statement
highlight! link typescriptHtmlElemProperties Normal
highlight! link typescriptIdentifier Statement
highlight! link typescriptMessage Normal
highlight! link typescriptNull Constant
highlight! link typescriptParens Normal

if has('nvim')
	let g:terminal_color_0 = '#1e2132'
	let g:terminal_color_1 = '#e27878'
	let g:terminal_color_2 = '#b4be82'
	let g:terminal_color_3 = '#e2a478'
	let g:terminal_color_4 = '#84a0c6'
	let g:terminal_color_5 = '#a093c7'
	let g:terminal_color_6 = '#89b8c2'
	let g:terminal_color_7 = '#c6c8d1'
	let g:terminal_color_8 = '#6b7089'
	let g:terminal_color_9 = '#e98989'
	let g:terminal_color_10 = '#c0ca8e'
	let g:terminal_color_11 = '#e9b189'
	let g:terminal_color_12 = '#91acd1'
	let g:terminal_color_13 = '#ada0d3'
	let g:terminal_color_14 = '#95c4ce'
	let g:terminal_color_15 = '#d2d4de'
else
	let g:terminal_ansi_colors = [
		\ '#1e2132',
		\ '#e27878',
		\ '#b4be82',
		\ '#e2a478',
		\ '#84a0c6',
		\ '#a093c7',
		\ '#89b8c2',
		\ '#c6c8d1',
		\ '#6b7089',
		\ '#e98989',
		\ '#c0ca8e',
		\ '#e9b189',
		\ '#91acd1',
		\ '#ada0d3',
		\ '#95c4ce',
		\ '#d2d4de'
	\ ]
endif

" Overrides.
highlight! Cursor ctermbg=252 ctermfg=234 guibg=#c6c8d1 guifg=#131315
highlight! EndOfBuffer ctermbg=234 ctermfg=236 guibg=#131315 guifg=#242940
highlight! EndOfBuffer ctermfg=bg guifg=bg | " Hide tilde symbols for all buffers.
highlight! Error ctermbg=234 ctermfg=203 guibg=#131315 guifg=#e27878
highlight! ErrorMsg ctermbg=234 ctermfg=203 guibg=#131315 guifg=#e27878
highlight! NonText ctermbg=234 ctermfg=236 guibg=#131315 guifg=#242940
highlight! Normal ctermbg=234 ctermfg=252 guibg=#131315 guifg=#c6c8d1
highlight! SpecialKey ctermbg=234 ctermfg=236 guibg=#131315 guifg=#242940
highlight! StatusLine ctermbg=243 ctermfg=238 guibg=#818596 guifg=#131315
highlight! StatusLineNC ctermbg=243 ctermfg=237 guibg=#3e445e guifg=#131315
highlight! TabLine cterm=NONE ctermbg=245 ctermfg=234 gui=NONE guibg=#1e2132 guifg=#818596
highlight! TabLineFill cterm=reverse ctermbg=234 ctermfg=245 gui=NONE guibg=#1e2132 guifg=#818596
highlight! TabLineSel cterm=NONE ctermbg=234 ctermfg=252 gui=NONE guibg=#3e445e guifg=#9a9ca5
highlight! WarningMsg ctermbg=234 ctermfg=203 guibg=#131315 guifg=#e27878
highlight! ALEErrorSign ctermbg=235 ctermfg=203 guibg=#131315 guifg=#e27878
highlight! ALEWarningSign ctermbg=235 ctermfg=216 guibg=#131315 guifg=#e2a478
execute 'highlight! CursorLineNr guibg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'cterm')
execute 'highlight! SignColumn guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
execute 'highlight! VertSplit guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
execute 'highlight! LineNr guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
execute 'highlight! GitGutterAdd guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
execute 'highlight! GitGutterChange guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
execute 'highlight! GitGutterChangeDelete guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
execute 'highlight! GitGutterDelete guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
