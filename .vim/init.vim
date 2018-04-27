" Disable unused built-in functionality.
runtime startup/disable.vim

" Enable loading {ftdetect,ftplugin,indent}/*.vim files.
filetype plugin indent on

" Enable loading syntax/*.vim files.
syntax on

" Set leader keys.
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'

" Automatically install vim-plug itself if it's not installed.
if !filereadable($HOME . '/.vim/bundle/plug.vim/autoload/plug.vim')
	silent !curl
		\ --fail --location --create-dirs --output ~/.vim/bundle/plug.vim/autoload/plug.vim
		\ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Initialize plugin manager and load plugins.
set runtimepath+=~/.vim/bundle/plug.vim/
call plug#begin('~/.vim/bundle')
	runtime! package/*.vim
call plug#end()
