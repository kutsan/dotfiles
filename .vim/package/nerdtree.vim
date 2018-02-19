scriptencoding UTF-8

" File explorer.
Plug 'scrooloose/nerdtree'

" Display hidden files.
let g:NERDTreeShowHidden = 1

" Set buffer width.
let g:NERDTreeWinSize = 35

" Keep the tree sync on file deletion or rename.
let g:NERDTreeAutoDeleteBuffer = 1

" Include bookmarks table.
let g:NERDTreeShowBookmarks = 1

" Custom file where bookmarks are saved.
let g:NERDTreeBookmarksFile = expand('$HOME') . '/.vim/cache/share/nerdtreebookmarks'

" Disable the help text.
let g:NERDTreeMinimalUI = 1

" Hide some files and folders.
let g:NERDTreeIgnore = ['\.DS_Store$', '\.git$']

" Use natural sort order.
let g:NERDTreeNaturalSort = 1

" Change arrow icons for folders.
let g:NERDTreeDirArrowExpandable = ' ' " U+200B
let g:NERDTreeDirArrowCollapsible = ' ' " U+200B

" Define mappings.
let g:NERDTreeMapActivateNode = 'l'
let g:NERDTreeMapOpenRecursively = 'L'
let g:NERDTreeMapCloseDir = 'h'
let g:NERDTreeMapCloseChildren = 'H'
let g:NERDTreeMapPreview = 'i'
let g:NERDTreeMapOpenSplit = 'sp'
let g:NERDTreeMapOpenVSplit = 'vs'
let g:NERDTreeMapDeleteBookmark = 'bd'
let g:NERDTreeMapToggleBookmarks = 'bt'
let g:NERDTreeMapJumpParent = 'gp'
let g:NERDTreeMapJumpRoot = 'gr'
let g:NERDTreeMapJumpNextSibling = '<C-j>'
let g:NERDTreeMapJumpPrevSibling = '<C-k>'
let g:NERDTreeMapUpdirKeepOpen = '-'
let g:NERDTreeMapRefresh = 'r'
let g:NERDTreeMapRefreshRoot = 'R'
let g:NERDTreeMapMenu = 'm'
let g:NERDTreeMapChangeRoot = 'zr'
let g:NERDTreeMapToggleHidden = 'zh'
let g:NERDTreeMapToggleZoom = 'zv'
let g:NERDTreeMapHelp = '?'

" Disable unused mappings.
let g:NERDTreeMapCWD = ''
let g:NERDTreeMapChdir = ''
let g:NERDTreeMapJumpFirstChild = ''
let g:NERDTreeMapJumpLastChild = ''
let g:NERDTreeMapOpenExpl = ''
let g:NERDTreeMapOpenInTab = ''
let g:NERDTreeMapOpenInTabSilent = ''
let g:NERDTreeMapPreviewSplit = ''
let g:NERDTreeMapPreviewVSplit = ''
let g:NERDTreeMapQuit = ''
let g:NERDTreeMapToggleFiles = ''
let g:NERDTreeMapToggleFilters = ''
let g:NERDTreeMapUpdir = ''

" Open explorer buffer silently.
nnoremap <silent> <Leader>f :NERDTreeToggle<Bar>wincmd p<Enter>

augroup nerdtreesettings
	autocmd!

	" Always disable 'list' option.
	autocmd FileType nerdtree setlocal nolist

	" Autostart on launch without focus.
	autocmd VimEnter * NERDTreeToggle | wincmd p
augroup end
