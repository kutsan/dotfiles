scriptencoding UTF-8

" Show Git diff in the sign column.
Plug 'airblade/vim-gitgutter'

" Disable all key mappings.
let g:gitgutter_map_keys = 0

" Change default gutter signs.
let g:gitgutter_sign_added = '│' " U+2502
let g:gitgutter_sign_modified = '│' " U+2502
let g:gitgutter_sign_removed = '│' " U+2502
let g:gitgutter_sign_modified_removed = '│' " U+2502

" Increase the maximum number of signs.
let g:gitgutter_max_signs = 10000

" Disable updating on CursorHold, CursorHoldI.
let g:gitgutter_realtime = 0
