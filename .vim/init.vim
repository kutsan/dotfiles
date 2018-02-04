" Default encoding.
set encoding=UTF-8 " (vim-only)
scriptencoding UTF-8

" Turns on filetype detection.
filetype plugin indent on

" Enable syntax highlighting.
if !exists('g:syntax_on')
	syntax enable
endif

" Define leader keys.
let g:mapleader = ' ' " Space key.
let g:maplocalleader = '\'

" Disable unused built-in plugins.
let g:loaded_gzip = 1
let g:loaded_rrhelper = 1
let g:loaded_tarPlugin = 1
let g:loaded_zipPlugin = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwSettings = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_logipat = 1
let g:loaded_man = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1

" Initialize plugin manager and load plugins.
call plug#begin('~/.vim/bundle')
	" Source all files under package directory.
	for s:package in split(glob(fnamemodify($MYVIMRC, ':p:h') . '/package/*.vim'), '\n')
		if filereadable(s:package)
			execute 'source' s:package
		endif
	endfor
call plug#end()
