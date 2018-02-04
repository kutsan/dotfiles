" Visualize undo tree.
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Open tree on the right side and open diff below the buffer.
let g:undotree_WindowLayout = 4

" Move focus after being opened.
let g:undotree_SetFocusWhenToggle = 1

" Disable 'Press ? for help' text.
let g:undotree_HelpLine = 0

" Use short timestamps.
let g:undotree_ShortIndicators = 1

" Set the undotree window width.
let g:undotree_SplitWidth = 30

nnoremap <Leader>u :UndotreeToggle<Enter>
