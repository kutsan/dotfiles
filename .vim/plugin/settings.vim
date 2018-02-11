scriptencoding UTF-8

" Color options and scheme.
set background=dark " Choose dark colors if available.
set termguicolors " Enable True Color support.
colorscheme iceberg " Color scheme and its overrides.
	highlight! link QuickFixLine CursorLine
	highlight! StatusLine cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#818596 guifg=#1e2132 term=reverse
	highlight! StatusLineNC cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#1e2132
	highlight! LineNr guibg=#161821 guifg=#444b71
	highlight! CursorLineNr ctermbg=237 ctermfg=253 guibg=#1e2132 guifg=#cdd1e6
	highlight! SignColumn ctermbg=235 ctermfg=239 guibg=#161821 guifg=#444b71
	highlight! GitGutterAdd ctermbg=235 ctermfg=150 guibg=#161821 guifg=#b4be82
	highlight! GitGutterChange ctermbg=235 ctermfg=109 guibg=#161821 guifg=#89b8c2
	highlight! GitGutterChangeDelete ctermbg=235 ctermfg=109 guibg=#161821 guifg=#89b8c2
	highlight! GitGutterDelete ctermbg=235 ctermfg=203 guibg=#161821 guifg=#e27878
	highlight! VertSplit cterm=NONE ctermbg=233 ctermfg=233 gui=NONE guibg=#161821 guifg=#0f1117

" Shared data location.
if has('nvim')
	execute 'set shada+=n' . $VIM_HOME . '/cache/share/nviminfo'
else
	execute 'set viminfo+=!,n' . $VIM_HOME . '/cache/share/viminfo'
endif

" Editor
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set belloff=all " Turn off the bell upon all events.
set breakindent " Wrapped lines will be indented with same amount of space.
set clipboard=unnamed,unnamedplus " Use system clipboard.
set complete-=i " Disable scanning current and included files.
set completeopt=longest,menuone " Options for insert mode completion.
set confirm " Seek for confirmation for certain commands instead of giving errors.
set cursorline " Highlight the line background of the cursor.
set display=lastline " As much as possible of the last line in a window will be displayed.
set fillchars= " Characters to fill the status lines and vertical separators.
set foldlevelstart=99 " Start editing with all folds open.
set foldmethod=indent " Use indent model for folding mechanism.
set foldtext=kutsan#settings#foldtext() " Use custom fold text function for folds.
set formatoptions=jcql " General text formatting options used by many mechanics.
set formatprg=par\ -w80 " External formatter program that will be used with `gq` operator.
set keywordprg=:help " Default command to be used when looking definition.
set langnoremap " Setting 'langmap' does not apply to characters resulting from a mapping.
set listchars=tab:.\ ,trail:•,nbsp:␣ " Strings to use when 'list' option set.
set modelines=1 " Maximum number of lines that is checked for set commands.
set mouse=a " Enable mouse use in all modes.
set nojoinspaces " Disable inserting two spaces after `.`, `?`, `!` with join command.
set nolangremap " Setting 'langmap' does not apply to characters resulting from a mapping.
set noruler " Disable showing line numbers in command line.
set noshowmatch " When a bracket is inserted, do not jump to the matching one.
set nostartofline " Prevent the cursor from changing the current column when jumping.
set nowrap " Prevent wrapping for long lines.
set nrformats-=octal " Don't consider numbers that start with a zero as octal.
set number " Show line numbers alongside relative numbers.
set pastetoggle=<F2> " Toggle paste mode with given key.
set pumheight=10 " Maximum number of items to show in the pop-up menu for completion.
set relativenumber " Show relative line numbers alongside numbers.
set report=0 " Threshold for reporting number of lines changed.
set scrolloff=8 " Minimum number of screen lines to keep above and below the cursor.
set sessionoptions-=options " Options for `mksession` command.
set shortmess=filmnrwxoOstTIc " Use abbreviations and short messages in command menu line.
set sidescroll=20 " Columns to scroll horizontally when cursor is moved off the screen.
set sidescrolloff=5 " Minimum number of screen columns to keep to cursor right.
set signcolumn=yes " Always draw the sign column even there is no sign in it.
set synmaxcol=200 " Maximum column in which to search for syntax items.
set textwidth=0 " Prevent auto wrapping when using affecting keys.
set timeoutlen=500 " Mapping delays in milliseconds.
set title " Show title as in 'titlestring' in title bar of window.
set titlestring=%f " Format of the title used by 'title'.
set ttimeoutlen=10 " Key code delays in milliseconds.
set ttyfast " More characters will be sent to the screen for redrawing in terminal.
set updatetime=2000 " If that milliseconds nothing is typed the swap file will be written.
set visualbell " Instead of beeping, shows a visual bell on errors.
if has('nvim') | set inccommand=nosplit | endif " Show live substitution results as you type.
if has('nvim') | set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor | endif " Change cursor shape among modes.

" Indentation
set autoindent " Copy indent from current line when starting a new line.
set nosmarttab " Tab key always inserts blanks according to 'tabstop'.
set shiftround " Round indent to multiple of 'shiftwidth'. Applies to > and < commands.
set shiftwidth=4 " Affects what happens when you press `>>`, `<<` or `==`.
set smartindent " Automatically inserts one extra level of indentation in some cases.
set tabstop=4 " TAB character length.

" Search
set ignorecase " Make default search is not case sensitive.
set incsearch " Instantly show results when you start searching.
set nohlsearch " Disable highlight the matched search results by default.
set smartcase " If a uppercase character is entered, the search will be case sensitive.

" Backup
let &backupdir = $VIM_HOME . '/cache/backup//' " The directory for backup files.
let &directory = $VIM_HOME . '/cache/swap//' " The directory for swap files.
let &undodir = $VIM_HOME . '/cache/undo//' " The directory for undo files.
let &viewdir = $VIM_HOME . '/cache/view//' " Name of the directory where to store files for :mkview.
set undofile " Undo tree to be saved to a file when exiting a buffer.
set undolevels=100000 " Maximum undo limit.
set viewoptions=cursor,folds,unix,slash " Options used by `mkview` and `loadview` command.
set updatecount=100 " Typing this many characters will create the swap file.
if exists('$SUDO_USER') | set noswapfile | endif " Prevent creating root-owned swap files.

" Buffers, Windows, Tabs
set autoread " Read the file again if have been changed outside of Vim.
set hidden " Allows you to hide buffers with unsaved changes without being prompted.
set splitbelow " Splitting a window will put the new window below of the current one.
set splitright " Splitting a window will put the new window right of the current one.
set switchbuf=useopen " Jump to the first open window that contains the specified buffer.
set tabpagemax=50 " Maximum number of tab pages to be opened by the `tab all` command.

" Command Mode
set cmdwinheight=18 " Height of the command window size for commands like `q:` and `q/`.
set history=10000 " Define maximum command history size.
set noshowcmd " Disable displaying key presses at the right bottom.
set noshowmode " Disable native mode indicator.
set path+=** " Clever completion with the :find command.
set wildcharm=<C-z> " The key to start wildcard expansion inside macro.
set wildignorecase " Ignore case when completing in command menu.
set wildmenu " Command-line completion operates in an enhanced mode.
set wildmode=full " Wildmenu options.

" Status Line
set laststatus=2 " Always show the status line.
set statusline= " Initialize the status line variable.
set statusline+=%{repeat('\ ',4)} " Generate space characters given number of times.
set statusline+=%{kutsan#statusline#linter()} " Linter status with Unicode (from PUA) symbols.
set statusline+=%{repeat('\ ',4)} " Generate space characters given number of times.
set statusline+=%.30F " Path of the open file.
set statusline+=%{repeat('\ ',1)} " Generate space characters given number of times.
set statusline+=%{exists('*WebDevIconsGetFileTypeSymbol')?WebDevIconsGetFileTypeSymbol():''} " FileType Unicode (from PUA) symbol.
set statusline+=%{repeat('\ ',4)} " Generate space characters given number of times.
set statusline+=%03l/%03L:%02c " Line numbers and column numbers in <Line>:<Column> format.
set statusline+=%= " Align right all items from this point on.
set statusline+=%{&spell?'\ \ ':''} " Show an icon if spell checking enabled.
set statusline+=%{exists('*fugitive#head')?fugitive#head():''} " Git HEAD status.
set statusline+=%{exists('*fugitive#head')?repeat('\ ',1):''} " Git HEAD status spaces.
set statusline+=%y " File type.
set statusline+=%{repeat('\ ',1)} " Generate space characters given number of times.

" GUI
if has('gui_running')
	set browsedir=buffer " Use the same directory as current buffer's path when browsing files.
	set mousehide " The mouse pointer is hidden when characters are typed.
	set guifont=FuraCode_Nerd_Font:h16 " Font and font size.
	set guicursor+=a:blinkon0 " Disable cursor blinking for all modes.
	set guioptions+=c " Disable native dialogues, use text prompts for simple choices.
	set guioptions-=L " Hide left-hand scrollbar when there is a vertically split window.
	set guioptions-=R " Hide right-hand scrollbar when there is a vertically split window.
	set guioptions-=e " Disable native GUI tabs.
	set guioptions-=l " Hide left-hand scrollbar.
	set guioptions-=m " Disable menu bar.
	set guioptions-=r " Hide right-hand scrollbar.
endif

" Colors
highlight EndOfBuffer guifg=bg | " Hide tilde symbols for all buffers.
let g:terminal_color_0 = '#3b4252' " Black
let g:terminal_color_1 = '#bf616a' " Red
let g:terminal_color_2 = '#a3be8c' " Green
let g:terminal_color_3 = '#ebcb8b' " Yellow
let g:terminal_color_4 = '#81a1c1' " Blue
let g:terminal_color_5 = '#b48ead' " Magenta
let g:terminal_color_6 = '#88c0d0' " Cyan
let g:terminal_color_7 = '#e5e9f0' " White
let g:terminal_color_8 = '#4c566a' " Bold Black
let g:terminal_color_9 = '#bf616a' " Bold Red
let g:terminal_color_10 = '#a3be8c' " Bold Green
let g:terminal_color_11 = '#ebcb8b' " Bold Yellow
let g:terminal_color_12 = '#81a1c1' " Bold Blue
let g:terminal_color_13 = '#b48ead' " Bold Magenta
let g:terminal_color_14 = '#8fbcbb' " Bold Cyan
let g:terminal_color_15 = '#eceff4' " Bold White
