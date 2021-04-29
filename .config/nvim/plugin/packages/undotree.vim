" Add optional plugin to 'runtimepath' without sourcing anything.
silent! packadd! undotree

" Open tree on the right side and open diff below that.
let g:undotree_WindowLayout = 3

" Set the tree node shape.
let g:undotree_TreeNodeShape = '*'

" Set the tree vertical shape.
let g:undotree_TreeVertShape = '|'

" Use relative timestamps.
let g:undotree_RelativeTimestamp = 1

" Use short timestamps.
let g:undotree_ShortIndicators = v:true

" Move focus after being opened.
let g:undotree_SetFocusWhenToggle = v:true

" Disable 'Press ? for help' text.
let g:undotree_HelpLine = v:false

" Set the undotree window width.
let g:undotree_SplitWidth = 30

" Disable diff window by default.
let g:undotree_DiffAutoOpen = v:false

" Set diff window height.
let g:undotree_DiffpanelHeight = 10

" Set the command used to get the diff output.
let g:undotree_DiffCommand = 'diff'

" Highlight changed text.
let g:undotree_HighlightChangedText = v:true

" Show cursorline.
let g:undotree_CursorLine = v:true

" Default highlight groups for syntax items.
let g:undotree_HighlightSyntaxAdd = 'DiffAdd'
let g:undotree_HighlightSyntaxChange = 'DiffChange'
let g:undotree_HighlightSyntaxDel = 'DiffDelete'

" Define mapping.
nnoremap <silent> <Space>u :call undotree#UndotreeToggle()<CR>
