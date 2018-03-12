" Encoding
set encoding=UTF-8 " Default encoding. (vim-only)
scriptencoding UTF-8 " Default encoding for current script.

" Shared Data
if has('nvim')
	set shada+=n~/.vim/cache/share/nviminfo
else
	set viminfo+=!,n~/.vim/cache/share/viminfo
endif

" Colors
set background=dark " Choose dark colors if available.
set termguicolors " Enable True Color support.
silent! colorscheme iceberg " Color scheme and its overrides.
	if exists('g:colors_name') && g:colors_name ==# 'iceberg'
		highlight! EndOfBuffer ctermfg=bg guifg=bg | " Hide tilde symbols for all buffers.
		highlight! StatusLine ctermbg=243 ctermfg=238 guibg=#818596 guifg=#1e2132
		highlight! StatusLineNC ctermbg=243 ctermfg=237 guibg=#3e445e guifg=#1e2132
		execute 'highlight! CursorLineNr guibg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'cterm')
		execute 'highlight! SignColumn guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
		execute 'highlight! VertSplit guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
		execute 'highlight! LineNr guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
		execute 'highlight! GitGutterAdd guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
		execute 'highlight! GitGutterChange guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
		execute 'highlight! GitGutterChangeDelete guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
		execute 'highlight! GitGutterDelete guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') . ' ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
	endif

" Behaviour
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set belloff=all " Turn off the bell upon all events.
set breakindent " Wrapped lines will be indented with same amount of space.
set clipboard=unnamed,unnamedplus " Use system clipboard.
set confirm " Seek for confirmation for certain commands instead of giving errors.
set display=lastline " As much as possible of the last line in a window will be displayed.
set keywordprg=:help " Default command to be used when looking definition.
set modelines=1 " Maximum number of lines that is checked for set commands.
set mouse=nv " Enable mouse support only for normal and visual modes.
set nojoinspaces " Disable inserting two spaces after `.`, `?`, `!` with join command.
set nolangremap " Setting 'langmap' does not apply to characters resulting from a mapping.
set noruler " Disable showing line numbers in command line.
set noshowmatch " When a bracket is inserted, do not jump to the matching one.
set nostartofline " Prevent the cursor from changing the current column when jumping.
set nowrap " Prevent wrapping for long lines.
set nrformats-=octal " Don't consider numbers that start with a zero as octal.
set pumheight=10 " Maximum number of items to show in the pop-up menu for completion.
set report=0 " Threshold for reporting number of lines changed.
set scrolloff=8 " Minimum number of screen lines to keep above and below the cursor.
set sessionoptions-=options " Options for `mksession` command.
set shortmess=filmnrwxoOstTIc " Use abbreviations and short messages in command menu line.
set sidescroll=20 " Columns to scroll horizontally when cursor is moved off the screen.
set sidescrolloff=5 " Minimum number of screen columns to keep to cursor right.
set synmaxcol=200 " Maximum column in which to search for syntax items.
set textwidth=0 " Prevent auto wrapping when using affecting keys.
set timeoutlen=500 " Mapping delays in milliseconds.
set ttimeoutlen=10 " Key code delays in milliseconds.
set ttyfast " More characters will be sent to the screen for redrawing in terminal. (vim-only)
set updatetime=2000 " If that milliseconds nothing is typed CursorHold event will trigger.
set visualbell " Use visual bell instead of beeping on errors.
if has('nvim') | set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor | endif " Change cursor shape among modes.
if has('nvim') | set inccommand=nosplit | endif " Show live substitution results as you type.

" Interface
set cursorline " Highlight the line background of the cursor.
set fillchars=vert:⏐ " Characters to fill the status lines and vertical separators.
set laststatus=2 " Always show the status line.
set linebreak " Wrap lines in 'breakat', rather than at the last character.
set listchars=tab:│\ ,nbsp:␣,extends:…,precedes:… " Strings to use when 'list' option set.
set number " Show line numbers alongside relative numbers.
set relativenumber " Show relative line numbers alongside numbers.
set signcolumn=yes " Always draw the sign column even there is no sign in it.
set title " Show title as in 'titlestring' in title bar of window.
set titlestring=%f " Format of the title used by 'title'.

" Formatting
set formatoptions=jcql " General text formatting options used by many mechanics.
set formatprg=par\ -w80 " External formatter program that will be used with `gq` operator.

" Completion
set complete-=i " Disable scanning current and included files.
set completeopt=longest,menuone " Options for insert mode completion.
set path=. " Only try to find files in current directory.

" Indentation
set autoindent " Copy indent from current line when starting a new line.
set nosmarttab " Tab key always inserts blanks according to 'tabstop'.
set shiftround " Round indent to multiple of 'shiftwidth'. Applies to > and < commands.
set shiftwidth=4 " Affects what happens when you press `>>`, `<<` or `==`.
set smartindent " Automatically inserts one extra level of indentation in some cases.
set tabstop=4 " TAB character length.

" Folding
set foldlevelstart=99 " Start editing with all folds open.
set foldmethod=indent " Use indent model for folding mechanism.
set foldtext=kutsan#settings#foldtext() " Use custom fold text function for folds.

" Search
set ignorecase " Make default search is not case sensitive.
set incsearch " Instantly show results when you start searching.
set nohlsearch " Disable highlight the matched search results by default.
set smartcase " If a uppercase character is entered, the search will be case sensitive.

" Backup
set backupdir=~/.vim/cache/backup// " The directory for backup files.
set directory=~/.vim/cache/swap// " The directory for swap files.
set undodir=~/.vim/cache/undo// " The directory for undo files.
set undofile " Undo tree to be saved to a file when exiting a buffer.
set undolevels=100000 " Maximum undo limit.
set updatecount=100 " Typing this many characters will create the swap file.
set viewdir=~/.vim/cache/view// " Name of the directory where to store files for :mkview.
set viewoptions=cursor,folds,unix,slash " Options used by `mkview` and `loadview` command.

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
set wildcharm=<C-z> " The key to start wildcard expansion inside macro.
set wildignorecase " Ignore case when completing in command menu.
set wildmenu " Command-line completion operates in an enhanced mode.
set wildmode=full " Wildmenu options.

" GUI
if has('gui_running')
	set browsedir=buffer " Use the same directory as current buffer's path when browsing files.
	set mousehide " Mouse pointer is hidden when characters are typed.
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

" Root
if exists('$SUDO_USER')
	set noswapfile
	set nobackup
	set nowritebackup
	set noundofile

	if has('nvim')
		set shada=
	else
		set viminfo=
	endif
endif
