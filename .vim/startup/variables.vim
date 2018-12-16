" Set leader keys.
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'

" Set internal g:clipboard to save some startup time.
if has('mac') && executable('pbpaste')
	let g:clipboard = {
		\ 'name': 'pbcopy',
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
