scriptencoding UTF-8

" Adds additional file type glyphs to popular plugins.
Plug 'ryanoasis/vim-devicons'

" Enable open and close folder glyph flags.
let g:DevIconsEnableFoldersOpenClose = 1

" Enable folder glyph flag.
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Enable vimfiler support.
let g:webdevicons_enable_vimfiler = 1

" Change default icons.
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " Initialize the custom icons object.
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '' " Disable folder icons.
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '' " Default icon in case there no match found.
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = '' " Default HTML icon.
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = '' " Default CSS icon.
