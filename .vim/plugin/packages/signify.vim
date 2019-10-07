""
" Show Git diff in the sign column.
""

scriptencoding UTF-8

" Disable showing counts next to signs.
let g:signify_sign_show_count = v:false

" Define symbols for signs.
let g:signify_sign_add = '│' " U+2502
let g:signify_sign_delete = '│' " U+2502
let g:signify_sign_delete_first_line = '│' " U+2502
let g:signify_sign_change = '│' " U+2502
let g:signify_sign_changedelete = '│' " U+2502

" [i]n [c]hunk and [a] [c]hunk motions.
omap ic <Plug>(signify-motion-inner-pending)
xmap ic <Plug>(signify-motion-inner-visual)
omap ac <Plug>(signify-motion-outer-pending)
xmap ac <Plug>(signify-motion-outer-visual)
