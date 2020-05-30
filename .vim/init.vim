" Enable loading {ftdetect,ftplugin,indent}/*.vim files.
filetype plugin indent on

" Enable loading syntax/*.vim files.
syntax on

" Set leader keys.
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'

" Disable unused built-in plugins.
let g:loaded_gzip = v:true
let g:loaded_rrhelper = v:true
let g:loaded_tarPlugin = v:true
let g:loaded_zipPlugin = v:true
let g:loaded_netrwPlugin = v:true
let g:loaded_netrwFileHandlers = v:true
let g:loaded_netrwSettings = v:true
let g:loaded_2html_plugin = v:true
let g:loaded_vimballPlugin = v:true
let g:loaded_getscriptPlugin = v:true
let g:loaded_logipat = v:true
let g:loaded_tutor_mode_plugin = v:true
let g:loaded_matchit = v:true

" Set internal g:clipboard to save some startup time.
if has('mac') && executable('pbpaste')
	let g:clipboard = {
		\ 'name': 'pbcopy',
		\ 'cache_enabled': v:false,
		\ 'copy': {
			\ '+': 'pbcopy',
			\ '*': 'pbcopy'
		\ },
		\ 'paste': {
			\ '+': 'pbpaste',
			\ '*': 'pbpaste'
		\ }
	\ }
elseif exists('$DISPLAY') && executable('xclip')
	let g:clipboard = {
		\ 'name': 'xclip',
		\ 'cache_enabled': v:false,
		\ 'copy': {
			\ '+': 'xclip -quiet -i -selection clipboard',
			\ '*': 'xclip -quiet -i -selection primary'
		\ },
		\ 'paste': {
			\ '+': 'xclip -o -selection clipboard',
			\ '*': 'xclip -o -selection primary'
		\ }
	\ }
endif
