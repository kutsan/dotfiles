" Visualize undo tree.
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Open tree on the right side and open diff below the buffer.
let g:undotree_WindowLayout = 4

" Move focus after being opened.
let g:undotree_SetFocusWhenToggle = v:true

" Disable 'Press ? for help' text.
let g:undotree_HelpLine = v:false

" Use short timestamps.
let g:undotree_ShortIndicators = v:true

" Set the undotree window width.
let g:undotree_SplitWidth = 30

nnoremap <Leader>u :UndotreeToggle<Enter>
