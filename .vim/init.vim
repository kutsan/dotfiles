" Filetype Detection
filetype plugin indent on

" Syntax Highlighting
if !exists('g:syntax_on')
	syntax enable
endif

" Leader Keys
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'

" Disable unused built-in plugins.
let g:loaded_gzip = 1
let g:loaded_rrhelper = 1
let g:loaded_tarPlugin = 1
let g:loaded_zipPlugin = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwSettings = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_logipat = 1
let g:loaded_man = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_matchit = 1

" Automatically install vim-plug itself if it's not installed.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl
		\ --fail --location --create-dirs --output ~/.vim/autoload/plug.vim
		\ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Initialize plugin manager and load plugins.
call plug#begin('~/.vim/bundle')
	" Source all files under package directory.
	for s:package in split(glob('~/.vim/package/*.vim'), '\n')
		if filereadable(s:package)
			execute 'source' s:package
		endif
	endfor
call plug#end()

" Automatically install non-existing plugins.
augroup vimplugplugininstallation
	autocmd VimEnter *
		\ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) |
			\ PlugInstall --sync |
			\ quitall |
		\ endif
augroup END
