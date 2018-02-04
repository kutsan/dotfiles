" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Disable default key mappings.
let g:AutoPairsShortcutToggle = 0
let g:AutoPairsShortcutJump = 0
let g:AutoPairsShortcutFastWrap = 0
let g:AutoPairsShortcutBackInerts = 0

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
