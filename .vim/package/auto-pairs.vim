" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Disable default key mappings.
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutBackInerts = ''

" Specifies which symbols should be automatically paired.
let g:AutoPairs = {
	\ '(': ')',
	\ '[': ']',
	\ '{': '}',
	\ "'": "'",
	\ '"': '"',
	\ '`': '`',
	\ '<': '>'
\ }

" https://github.com/jiangmiao/auto-pairs/issues/187
augroup autopairsfixknownbug
	autocmd!
	autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">
augroup end
