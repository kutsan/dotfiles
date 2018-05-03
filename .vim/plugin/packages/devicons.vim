""
" Adds additional file type glyphs to popular plugins.
""

scriptencoding UTF-8

" Enable open and close folder glyph flags.
let g:DevIconsEnableFoldersOpenClose = v:true

" Enable folder glyph flag.
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true

" Use one space after a glyph instead of two.
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" Set default file and directory icons.
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

" Set custom icons.
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
	\ 'html': '',
	\ 'css': ''
\ }
