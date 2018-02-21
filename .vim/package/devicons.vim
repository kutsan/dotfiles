scriptencoding UTF-8

" Adds additional file type glyphs to popular plugins.
Plug 'ryanoasis/vim-devicons'

" Enable open and close folder glyph flags.
let g:DevIconsEnableFoldersOpenClose = 1

" Enable folder glyph flag.
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Use one space after a glyph instead of two.
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " Initialize the custom icons object.
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '' " Default icon in case there no match found.
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '' " Default closed directory icon.
let g:DevIconsDefaultFolderOpenSymbol = '' " Default open directory icon.
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = '' " Default HTML icon.
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = '' " Default CSS icon.
