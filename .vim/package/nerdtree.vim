scriptencoding UTF-8

" File explorer.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Extra syntax highlighting for devicons.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }

" Display hidden files.
let g:NERDTreeShowHidden = v:true

" Set buffer width.
let g:NERDTreeWinSize = 35

" Keep the tree sync on file deletion or rename.
let g:NERDTreeAutoDeleteBuffer = v:true

" Custom file where bookmarks are saved.
let g:NERDTreeBookmarksFile = $HOME . '/.vim/cache/share/nerdtreebookmarks'

" Disable the help text.
let g:NERDTreeMinimalUI = v:true

" Hide some files and folders.
let g:NERDTreeIgnore = [
	\ '^\.DS_Store$[[file]]',
	\ '^\.git$[[dir]]'
\ ]

" Use natural sort order.
let g:NERDTreeNaturalSort = v:true

" Use `trash-cli` when deleting files and folders.
let g:NERDTreeRemoveDirCmd = 'trash '
let g:NERDTreeRemoveFileCmd = 'trash '

" Change arrow icons for folders.
let g:NERDTreeDirArrowExpandable = ' ' " U+200B
let g:NERDTreeDirArrowCollapsible = ' ' " U+200B

" Change default statusline.
let g:NERDTreeStatusline = '%{kutsan#statusline#nerdtree()}'

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

" Toggle explorer buffer silently.
nnoremap <silent> <Leader>f :NERDTreeToggle <Bar> wincmd p<Enter>

" Find current file.
nnoremap <silent> <Leader>F :NERDTreeFind<Enter>

augroup nerdtreesettings
	autocmd!

	" Disable 'list' option.
	autocmd FileType nerdtree setlocal nolist

	" Disable highlighting cursor line.
	autocmd FileType nerdtree setlocal nocursorline

	" Disable the sign column.
	autocmd FileType nerdtree setlocal signcolumn=no

	" Make concealed text is completely hidden.
	autocmd FileType nerdtree setlocal conceallevel=3 concealcursor=nvic

	" Hide current working directory line.
	autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal

	" Hide slashes after each directory node.
	autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# conceal containedin=NERDTreeDir contained
augroup end
