" Visualize undo tree.
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Open tree on the right side and open diff below that.
let g:undotree_WindowLayout = 3

" Move focus after being opened.
let g:undotree_SetFocusWhenToggle = v:true

" Disable 'Press ? for help' text.
let g:undotree_HelpLine = v:false

" Use short timestamps.
let g:undotree_ShortIndicators = v:true

" Set the undotree window width.
let g:undotree_SplitWidth = 30

" Disable diff window by default.
let g:undotree_DiffAutoOpen = v:false

nnoremap <Leader>u :UndotreeToggle<Enter>
