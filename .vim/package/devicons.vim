scriptencoding UTF-8

" Adds additional file type glyphs to popular plugins.
Plug 'ryanoasis/vim-devicons'

" Enable open and close folder glyph flags.
let g:DevIconsEnableFoldersOpenClose = 1

" Enable folder glyph flag.
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

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
