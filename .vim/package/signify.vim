scriptencoding UTF-8

" Show Git diff in the sign column.
Plug 'mhinz/vim-signify'

" Only support git version system.
let g:signify_vcs_list = ['git']

" Define symbols for signs.
let g:signify_sign_add = '│' " U+2502
let g:signify_sign_delete = '│' " U+2502
let g:signify_sign_delete_first_line = '│' " U+2502
let g:signify_sign_change = '│' " U+2502
let g:signify_sign_changedelete = '│' " U+2502
